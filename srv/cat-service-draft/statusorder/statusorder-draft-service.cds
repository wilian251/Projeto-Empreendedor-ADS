using finalproject as finalproject from '../../../db/data-model';

service OrderStatusDraft {
    @odata.draft.enabled
    entity StatusOrderFiori as projection on finalproject.StatusOrder;
}