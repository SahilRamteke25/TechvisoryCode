trigger OpportunityDeleteRestriction on Opportunity (before delete) 
{
    for(Opportunity opp : trigger.old)
    {
        if(opp.StageName == 'Closed Won' || opp.StageName == 'Closed Lost')
        {
            opp.addError('The opportunity which has stage status is closed won or closed lost that opportunities are not able to delete.');
        }
    }

}