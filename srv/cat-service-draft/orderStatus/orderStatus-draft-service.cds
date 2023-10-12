using finalproject as finalproject from '../../../db/data-model';

service OrderStatusDraft {
    @odata.draft.enabled
    entity StatusOrder as projection on finalproject.StatusOrder;
}