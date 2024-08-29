-- +goose Up
CREATE TABLE IF NOT EXISTS `campaign_groups` (campaign_id bigint,group_id bigint );
CREATE UNIQUE INDEX IF NOT EXISTS uniqueCampaignIdGroupId ON campaign_groups (campaign_id, group_id);

-- +goose Down
DROP TABLE `campaign_groups`;
