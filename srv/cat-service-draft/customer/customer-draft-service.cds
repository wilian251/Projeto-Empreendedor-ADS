using finalproject as finalproject from '../../../db/data-model';

service CustomerServiceDraft {// @( requires:'authenticated-user') {
    @odata.draft.enabled
    entity CustomerFiori as projection on finalproject.Customer;
    entity AddressFiori as projection on finalproject.Address;
}