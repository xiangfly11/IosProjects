//
//  ListViewController.m
//  MusicToday
//
//  Created by Jiaxiang Li on 15/8/17.
//  Copyright (c) 2015年 Jiaxiang Li. All rights reserved.
//

#import "ListViewController.h"
#import "Album.h"
#import "CustomerTableViewCell.h"
#import "DetailViewController.h"


@interface ListViewController ()
{
    NSMutableData *webData;
    NSDictionary *albumsDictionary;
    NSDictionary *feed;
    NSArray *entry;
    
    NSMutableArray *albumArray;
    
    NSArray *currentArray;
    
    NSIndexPath *currentIndexPath;
    
    NSInteger *currentIndex;
    
    
    DetailViewController *myDetailView;
}

@end

@implementation ListViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView setDelegate:self];
    [self.tableView setDataSource: self];
    [self initArray];
    
    //NSString *url=@"https://itunes.apple.com/us/rss/topalbums/limit=50/json";
    
    //[self initConnectionWithUrl:url];
    
}



-(void) initArray
{
    self.myAlbums=[[NSMutableArray alloc]init];
    self.myClassicAlbums=[[NSMutableArray alloc]init];
    self.myCountryAlbums=[[NSMutableArray alloc] init];
    self.myRockAlbums=[[NSMutableArray alloc] init];
    self.myOtherAlbums=[[NSMutableArray alloc] init];
    self.myElectronicAlbums=[[NSMutableArray alloc] init];
    self.myPopAlbums=[[NSMutableArray alloc] init];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



-(void) initConnectionWithUrl:(NSString *) url
{
    self.url=[NSURL URLWithString:url];
    self.request=[NSURLRequest requestWithURL:self.url];
    self.connection=[NSURLConnection connectionWithRequest:self.request delegate:self];
    
    if (self.connection) {
        webData=[[NSMutableData alloc]init];
    }

}


-(void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error: %@",[error description]);
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [webData setLength:0];
}


-(void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
}

-(void) connectionDidFinishLoading:(NSURLConnection *) connection
{
    NSArray *myEntry=[NSArray arrayWithArray:[self getEntryFromWebdata:webData]];
    
    for (NSInteger index=0; index<myEntry.count; index++) {
        Album *album=[[Album alloc]initWithIndex:index fromEntry:myEntry];
        [self.myAlbums addObject:album];
    }
    
    NSLog(@"categoryIndex:%li",(long)self.categoryIndex);
    
    [self categoriesAlbums:self.myAlbums];
    [self.tableView reloadData];
    
}


-(void) categoriesAlbums:(NSMutableArray *) albums
{
    for (NSInteger index=0; index<albums.count; index++) {
        Album *album=[albums objectAtIndex:index];
        if ([album.category isEqualToString:@"Pop"])
        {
            [self.myPopAlbums addObject:[albums objectAtIndex:index]];
        }else if ([album.category isEqualToString:@"Country"])
        {
            [self.myCountryAlbums addObject:[albums objectAtIndex:index]];
        }else if ([album.category isEqualToString:@"Classic"])
        {
            [self.myClassicAlbums addObject:[albums objectAtIndex:index]];
        }else if ([album.category isEqualToString:@"Electronic"])
        {
            [self.myElectronicAlbums addObject:[albums objectAtIndex:index]];
        }else if ([album.category isEqualToString:@"Rock"])
        {
            [self.myRockAlbums addObject:[albums objectAtIndex:index]];
        }else
        {
            [self.myOtherAlbums addObject:[albums objectAtIndex:index]];
        }
             
    }
}


-(NSArray *) getEntryFromWebdata:(NSMutableData *) data
{
    albumsDictionary=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    
    feed=[albumsDictionary objectForKey:@"feed"];
    
    entry=[feed objectForKey:@"entry"];
    
    return entry;
}



-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger num;
    
    switch ((int)self.categoryIndex) {
        case 0:
            num=self.myPopAlbums.count;
            break;
        case 1:
            num=self.myClassicAlbums.count;
            break;
        case 2:
            num=self.myCountryAlbums.count;
            break;
        case 3:
            num=self.myRockAlbums.count;
            break;
        case 4:
            num=self.myElectronicAlbums.count;
            break;
        case 5:
            num=self.myOtherAlbums.count;
            break;
        default:
            break;
    }
    
    return num;
    
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier=@"cell";
    
    CustomerTableViewCell *cell=(CustomerTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!cell){
        NSArray *nib=[[NSBundle mainBundle] loadNibNamed:@"CustomerTableCell" owner:self options:nil];
        cell=[nib objectAtIndex:0];
        
        
    }
    NSInteger index=(NSInteger)self.categoryIndex;
    
    currentArray=[self returnCorrectAlbums:index ];
    
    Album *album=[currentArray objectAtIndex:indexPath.row];
    cell.nameLabel.text=album.title;
    cell.imageView.image=album.icon;
    cell.categoryLabel.text=album.category;
    cell.priceLabel.text=album.price;
    return  cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"goToDetail" sender:self];
    
    currentIndex=(NSInteger *)indexPath.row;
    
    myDetailView.index=currentIndex;
    
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"goToDetail"]) {
        DetailViewController *detailView=(DetailViewController *)[segue destinationViewController];
        
        myDetailView=detailView;
        
        detailView.detailAlbum=nil;
        
        detailView.myAlbumsArray=currentArray;
    }
}


-(NSArray *) returnCorrectAlbums:(NSInteger) index
{
    NSArray *arrayAlbums;
    
    switch ((int)self.categoryIndex) {
        case 0:
            arrayAlbums=self.myPopAlbums;
            break;
        case 1:
            arrayAlbums=self.myClassicAlbums;
            break;
        case 2:
            arrayAlbums=self.myCountryAlbums;
            break;
        case 3:
            arrayAlbums=self.myRockAlbums;
            break;
        case 4:
            arrayAlbums=self.myElectronicAlbums;
            break;
        case 5:
            arrayAlbums=self.myOtherAlbums;
            break;
        default:
            break;
    }
    return arrayAlbums;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 108;
}

@end
