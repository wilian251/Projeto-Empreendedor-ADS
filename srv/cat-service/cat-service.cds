using finalproject as finalproject from '../../db/data-model';

@protocol: ['odata', 'rest', 'graphql']
service CatalogService {// @( requires:'authenticated-user') {
 
    entity Products as projection on finalproject.Products ;
    entity Customer as projection on finalproject.Customer ;
    entity Orders as projection on finalproject.Orders ;
    entity OrderItems as projection on finalproject.OrderItems;
}
