//
//  MenuTableViewController.m
//  SmartCamera
//
//  Created by  shihongliang on 11/7/18.
//  Copyright © 2018  shihongliang. All rights reserved.
//

#import "MenuTableViewController.h"

@interface MenuTableViewController ()

@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuArray = [[NSMutableArray alloc]initWithCapacity:40];
//    NSArray *titles = [NSArray arrayWithObjects: @"BANANA BREAD", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", nil];
//    NSArray *categories = [NSArray arrayWithObjects: @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", nil];
//    NSArray *description = [NSArray arrayWithObjects: @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", nil];
    NSArray *titles = [NSArray arrayWithObjects: @"Matcha Tiramisu", @" California Sushi Rolls ", @" Southern Potato Salad ", @"Spicy Chicken", @"Seafood Pancake", @"Shrimp Tempura", @"Maple Cookies", @"Momma's Shrimp and Cheese Grits", @"Slow Cooker Chicken Cacciatore", nil];
    
    
    
    NSArray *categories = [NSArray arrayWithObjects: @" Italian dessert", @"American sushi", @"Chinese Appetizer", @"Chinese", @"Korean", @"Japanese", @"Desserts", @"Side dish", @"Italian", nil];
    
    
    NSArray *description = [NSArray arrayWithObjects: @"Mix egg yolks and granulated sugar thick and pale yellow in color. Add mascarpone cheese and Epic Matcha green tea powder to the egg. Mix until smooth. Add cooled green tea. Combine matcha and confectioners’ sugar. Sift over tiramisu in an even layer. Cover and allow to chill for a few hours or overnight.", @"Combine rice and water 30 minutes. Combine the vinegar, sugar and salt, stirring until sugar is dissolved. Sprinkle toasted and black sesame seeds onto a plate. Place sushi mat on a work surface. Place 3/4 cup rice on plastic. Arrange a small amount of cucumber, crab and avocado about 1-1/2 in. from bottom edge of nori sheet. Roll up rice mixture over filling.", @"Cut each potato in half. Add 2 teaspoons salt and bring to a simmer.Place potatoes in a large bowl. Run a knife through them until they are cut into bite-sized pieces. Mix together mayonnaise, mustard, vinegar, sugar, and onion powder. Pour over potatoes and mix in well. Add relish, celery, onion, and the chopped eggs. Add salt and pepper to taste. Top with sliced egg and sprinkle with paprika. Cover with plastic wrap and refrigerate at least 4 hours.", @"Mix together brown sugar, honey, soy sauce, ginger, garlic and hot sauce in a small bowl. Lightly salt and pepper the chicken strips. Heat oil in a large skillet over medium heat. Add chicken strips and brown on both sides, about 1 minute per side. Pour the sauce over the chicken. Simmer uncovered until the sauce thickens, 8 to 10 minutes.", @"Combine seafood mix, water, flour, 1 bunch scallions, eggs, garlic, salt, and pepper in a bowl; mix until batter is thick. Heat olive oil in a nonstick skillet over medium-high heat. Pour half the batter evenly into the skillet. Cook until bottom and edges are browned, 7 to 8 minutes. Flip and continue cooking until the opposite side are browned, 7 to 8 minutes more. Transfer to a plate. Repeat with the remaining batter. Combine soy sauce, 1 stalk scallion, rice vinegar, sesame oil, brown sugar, gochugaru, and sesame seeds in a bowl. Serve pancakes with dipping sauce.", @"Mix rice wine and salt. Place shrimp into the mixture. Cover and marinate in the refrigerator at least 20 minutes.Heat oil in deep-fryer or large wok to 375 degrees F (190 degrees C). Mix together all-purpose flour, ice water, cornstarch, egg yolk, salt, white sugar, shortening and baking powder.Dip shrimp into the flour mixture to coat. Carefully place a few shrimp at a time in the hot oil. Deep fry until golden brown on all sides, about 1 1/2 minutes. Use a slotted spoon to remove from oil. Drain on paper towels. Serve warm.", @"Preheat oven to 350 degrees F. Grease cookie sheets. In a large bowl, cream the butter and brown sugar. Add the egg, syrup and vanilla. Mix until well blended. Sift together the flour, salt and baking soda. Stir into mixture until well blended. Shape into 1 inch balls and roll in sugar. Place on cookie sheets about 2 inches apart and flatten slightly.Bake 8 to 10 minutes in the preheated oven.", @"Bring water to a boil in a saucepan; stir grits and salt into the boiling water, cover, and reduce heat to low. Simmer grits until tender, 15 to 20 minutes. Remove from heat and keep warm. Melt 1/4 cup butter in a pan over medium heat; cook and stir garlic until softened, about 2 minutes. Stir in green onions, cooking until green onions are wilted, another 4 minutes.Mix shrimp into the garlic and green onions and cook until shrimp are firm and pink, about 5 minutes. Stir in lemon juice, cayenne pepper, salt, and black pepper. Mix 1/4 cup butter into the cooked grits, followed by processed cheese. Mix thoroughly until creamy and cheese is melted. Season with salt and black pepper.", @"Put the chicken in the slow cooker. Top with the spaghetti sauce, green bell peppers, mushrooms, onion, and garlic. Cover, and cook on Low for 7 to 9 hours.", nil];
    for (int i = 0; i < 9; i++) {
        foodMenu* f = [[foodMenu alloc]initWithTitle:titles[i] catergory:categories[i] descript:description[i]];
        [self.menuArray addObject:f];
       
    }
    self.searchResult = [NSMutableArray arrayWithCapacity:[self.menuArray count]];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    //self.searchController.searchBar.scopeButtonTitles = @[NSLocalizedString(@"ScopeButtonCountry",@"Country"),
                                                          //NSLocalizedString(@"ScopeButtonCapital",@"Capital")];
    self.searchController.searchBar.delegate = self;
     self.tableView.tableHeaderView = self.searchController.searchBar;
    self.definesPresentationContext = YES;
    [self.searchController.searchBar sizeToFit];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}
- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope
{
    [self updateSearchResultsForSearchController:self.searchController];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    if (self.searchEnabled) {
        return [self.searchResult count];
    }
    else{
        return [self.menuArray count];
    }
    return [self.menuArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"RecipeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    if (self.searchEnabled) {
        cell.textLabel.text = [[self.searchResult objectAtIndex:indexPath.row]title];
        
    }
    else{
        cell.textLabel.text = [[self.menuArray objectAtIndex:indexPath.row]title];
    }
    
   // cell.textLabel.text = [[self.menuArray objectAtIndex:indexPath.row]title];
    return cell;
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    NSString *searchString = searchController.searchBar.text;
   
    [self.tableView reloadData];
}
- (void)filterContentForSearchText:(NSString*)searchText
{
   // NSString *predicateFormat = @"%K BEGINSWITH[cd] %@";
    NSString *predicateFormat = @"%K contains[cd] %@";
    NSString *searchAttribute = @"title";
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF CONTAINS %@",
                                    searchText];
     NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateFormat, searchAttribute, searchText];
    
    self.searchResult = [self.menuArray filteredArrayUsingPredicate:predicate];
    [self.tableView reloadData];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchBar.text.length == 0) {
        self.searchEnabled = NO;
        [self.tableView reloadData];
    }
    else {
        self.searchEnabled = YES;
        [self filterContentForSearchText:searchBar.text];
    }
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.searchController.searchBar resignFirstResponder];
    self.searchEnabled = YES;
    [self filterContentForSearchText:searchBar.text];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.searchController.searchBar resignFirstResponder];
    [self.searchController.searchBar setText:@""];
    self.searchEnabled = NO;
    [self.tableView reloadData];
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     [self performSegueWithIdentifier: @"showRecipeDetail" sender: self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showRecipeDetail"]) {
        MenuDetailViewController *destViewController = segue.destinationViewController;
        
        NSIndexPath *indexPath = nil;
        
        if ([self.searchDisplayController isActive]) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            destViewController.recipt= [self.searchResult objectAtIndex:indexPath.row];
            
        } else {
            indexPath = [self.tableView indexPathForSelectedRow];
            destViewController.recipt = [self.menuArray objectAtIndex:indexPath.row];
        }
    }
    
}
@end
