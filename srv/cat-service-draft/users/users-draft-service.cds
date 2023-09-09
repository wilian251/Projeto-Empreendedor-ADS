using finalproject as finalproject from '../../../db/data-model';

service UsersServiceDraft {// @( requires:'authenticated-user') {
    @odata.draft.enabled
    entity UsersFiori as projection on finalproject.Users;  
}