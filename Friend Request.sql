select count(distinct(requester_id,accepter_id)) as unique_request   
from RequestAccepted; 

select count(distinct(sender_id,send_to_id)) as total_request 
from FriendRequest;