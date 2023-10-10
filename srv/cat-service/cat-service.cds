using finalproject from '../../db/data-model';

@protocol: ['odata', 'rest', 'graphql']
service CatalogService {// @( requires:'authenticated-user') {
    
    @Capabilities : { Readable, Insertable, Updatable, Deletable }
    entity Users as projection on finalproject.Users;
    @Capabilities : { Readable, Insertable, Updatable, Deletable }
    entity Products as projection on finalproject.Products;
    @Capabilities : { Readable, Insertable, Updatable, Deletable }
    entity Customer as projection on finalproject.Customer;
    @Capabilities : { Readable, Insertable, Updatable, Deletable }
    entity Orders as projection on finalproject.Orders;
    @Capabilities : { Readable, Insertable, Updatable, Deletable }
    entity OrderItems as projection on finalproject.OrderItems;
    @Capabilities : { Readable, Insertable, Updatable, Deletable }
    entity Proposal as projection on finalproject.Proposal;
}
