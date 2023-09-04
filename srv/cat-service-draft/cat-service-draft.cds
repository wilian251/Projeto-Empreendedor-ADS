using finalproject as finalproject from '../../db/data-model';

service CatalogServiceDraft {// @( requires:'authenticated-user') {
    @odata.draft.enabled
    entity UsersFiori as projection on finalproject.Users;
    @odata.draft.enabled
    entity ProductsFiori as projection on finalproject.Products;
    @odata.draft.enabled
    entity CustomerFiori as projection on finalproject.Customer;
    entity AddressFiori as projection on finalproject.Address;
    @odata.draft.enabled
    entity OrdersFiori as projection on finalproject.Orders;
    entity OrderItemsFiori as projection on finalproject.OrderItems;    
}
