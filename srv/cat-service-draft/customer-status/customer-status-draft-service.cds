using finalproject as finalproject from '../../../db/data-model';

service CustomerStatusDraft {
    @odata.draft.enabled
    entity CustomerStatusFiori as projection on finalproject.StatusCustomer;
}