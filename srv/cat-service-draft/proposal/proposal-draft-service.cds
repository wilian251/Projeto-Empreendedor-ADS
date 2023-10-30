using finalproject as finalproject from '../../../db/data-model';

service ProposalServiceDraft {
    entity ProposalFiori as projection on finalproject.Proposal;
    entity ProposalItemsFiori as projection on finalproject.ProposalItems;

    entity StatusOrder as projection on finalproject.StatusOrder;
}