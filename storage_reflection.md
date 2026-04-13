## 3.1

The app uses pre-signed urls in order to not have any accounts on the AWS side, and just have the app request the photos directly. The app itself needs access to S3 regardless to load and display all the photos uploaded thru the site into the S3 storage, so it makes sense to just have the application just have the keys to the storage and let the app handle who's allowed what. Immich (a self-hosted app that i use at home for my personal photos) uses a similar idea thru its own database, however the Xpix example is super simple and not as complex as that.

## 3.2

The pair of indexes are useful, since one keeps track of which photos belong to who, and the other constantly updates to refresh the feed on the main page. For the {user_index}, it needs the {user_id} hash to figure out which photos are for which user. For the {feed_index}, it uses the {uploaded_at} range key to sort them by the newest upload, as well as the {feed_key} to control the access to photos if theyre public (show) or private (hide).