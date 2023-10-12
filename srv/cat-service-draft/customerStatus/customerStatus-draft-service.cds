using finalproject as finalproject from '../../../db/data-model';

service CustomerStatusDraft {
    @odata.draft.enabled
    entity StatusCustomer as projection on finalproject.StatusCustomer;
}