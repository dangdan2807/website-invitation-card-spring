USE master;
GO
ALTER DATABASE web_invitation_cards SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
drop database web_invitation_cards;

use web_invitation_cards
go

