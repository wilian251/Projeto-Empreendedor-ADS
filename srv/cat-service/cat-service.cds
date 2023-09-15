using finalproject from '../../db/data-model';

@protocol: ['odata', 'rest', 'graphql']
service CatalogService {// @( requires:'authenticated-user') {
 
    entity Users as projection on finalproject.Users;
    entity Products as projection on finalproject.Products;
    entity Customer as projection on finalproject.Customer;
    entity Orders as projection on finalproject.Orders;
    entity OrderItems as projection on finalproject.OrderItems;
    entity Proposal as projection on finalproject.Proposal;
}
