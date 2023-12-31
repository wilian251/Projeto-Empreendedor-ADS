using finalproject as finalproject from '../../../db/data-model';

service OrdersServiceDraft {// @( requires:'authenticated-user') {
    @odata.draft.enabled
    entity OrdersFiori as projection on finalproject.Orders;
    @Capabilities : { Readable, Insertable, Updatable, Deletable }
    entity OrderItemsFiori as projection on finalproject.OrderItems;

    entity Products as projection on finalproject.Products where productInactive = false;
    entity StatusOrder as projection on finalproject.StatusOrder;
}