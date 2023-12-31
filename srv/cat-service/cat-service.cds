using finalproject from '../../db/data-model';

//@protocol: ['odata', 'rest', 'graphql']
service CatalogService {// @( requires:'authenticated-user') {

    entity Users as projection on finalproject.Users;
    entity Products as projection on finalproject.Products;
    entity Customer as projection on finalproject.Customer;
    entity Orders as projection on finalproject.Orders;
    entity OrderItems as projection on finalproject.OrderItems;
    entity Proposal as projection on finalproject.Proposal;
    entity ProposalItems as projection on finalproject.ProposalItems;
    entity StatusCustomer as projection on finalproject.StatusCustomer;
    entity StatusOrder as projection on finalproject.StatusOrder;
    
    type ProposalDeep: {
        proposalNumber: String;
        proposalTitle: String;
        proposalExpirationDate: Date;
        proposalStatusNumber: Integer;
        customers: Composition of many Customer;
        proposalItems: Composition of many ProposalItems;
    };

    function ProposalDeepEntity(ProposalDeep: ProposalDeep) returns ProposalDeep;
}
