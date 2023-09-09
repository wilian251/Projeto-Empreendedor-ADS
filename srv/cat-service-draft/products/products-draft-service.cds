using finalproject as finalproject from '../../../db/data-model';

service ProductsServiceDraft {// @( requires:'authenticated-user') {
    @odata.draft.enabled
    entity ProductsFiori as projection on finalproject.Products;
}