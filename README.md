# Disqus Sync

Very quick & dirty Disqus sync script to sync Authors & Posts from Disqus to a data store.

It was developed against PostgreSQL, but -- with Sqitch -- you should be able deploy this to anything Sqitch supports.

## Installation  

Install dependencies with `cpanm` or [Carton](https://metacpan.org/pod/Carton)

```
cpanm --installdeps .

or 

carton install
```

Create a disqus_sync.json configuration file:

```
{
  "api_secret":     "",    
  "forum":          "",
  "access_token":   "",
  "db_name":        "",
  "db_user":        "",
  "db_pass":        ""
}
```

Install the database with [Sqitch](http://sqitch.org):
* create a sqitch/sqitch.conf

```
[core]
	engine = pg
	# plan_file = sqitch.plan
	# top_dir = .
	# deploy_dir = deploy
	# revert_dir = revert
	# verify_dir = verify
	# extension = sql
[core "pg"]
	target = YOUR_DATABASE_NAME
[deploy]
	verify = true
[rebase]
	verify = true
```

* run `sqitch deploy`

You should now have a database with the correct tables (authors & posts)

## Usage

Run the sync 

```
./disqus-sync
```

The sync will start with the oldest author by ID ("user" in Disqus lingo) and work up until it has all the authors stored. The script only stores non-anonymous authors.

It will then start on posts, working up from the oldest date that is available in the database (defaulting to the oldest post in Disqus, if there are no posts in the database yet).

There are probably more posts than authors. And, because posts can be authored by anonymous users, which this is not storing, there's no enforced relation between posts and authors.
