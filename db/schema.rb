# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120627144933) do

  create_table "adms", :primary_key => "adm_id", :force => true do |t|
    t.timestamp "admstamp",                                             :null => false
    t.datetime  "admdt"
    t.datetime  "admmodifdt"
    t.date      "admdate"
    t.string    "admhospno",          :limit => 12
    t.string    "admstatus",          :limit => 20
    t.string    "currward",           :limit => 12
    t.date      "wardadmdate"
    t.string    "visitcode",          :limit => 20
    t.string    "servicecode",        :limit => 12
    t.integer   "admpid"
    t.string    "admconsultcode",     :limit => 12
    t.datetime  "transferdt"
    t.date      "transferdate"
    t.datetime  "dischdt"
    t.date      "dischdate"
    t.string    "dischdest",          :limit => 20
    t.boolean   "dischflag",                         :default => false
    t.boolean   "cancelflag",                        :default => false
    t.datetime  "canceldt"
    t.boolean   "deleteflag",                        :default => false
    t.datetime  "deletedt"
    t.boolean   "clerkedflag",                       :default => false
    t.datetime  "clerkeddt"
    t.integer   "bedno",              :limit => 1
    t.string    "admreason"
    t.string    "admixproceds"
    t.string    "admnurse",           :limit => 20
    t.string    "ewsfreq",            :limit => 30
    t.string    "ewsnotes"
    t.date      "preddischdate"
    t.string    "dischplan",          :limit => 100
    t.datetime  "lastewsdt"
    t.integer   "lastews_id",         :limit => 3
    t.integer   "lastews",            :limit => 1
    t.integer   "prevews",            :limit => 1
    t.integer   "ewsdiff",            :limit => 1
    t.string    "lastewsuser",        :limit => 20
    t.string    "mrsastatus",         :limit => 3
    t.string    "mrsasite",           :limit => 24
    t.date      "mrsadate"
    t.boolean   "diabeticflag",                      :default => false
    t.boolean   "invasivedeviceflag",                :default => false
    t.boolean   "immunocompflag",                    :default => false
    t.boolean   "woundsflag",                        :default => false
    t.string    "isolationstatus",    :limit => 6
    t.datetime  "nextewsdt"
    t.text      "alertstatus",        :limit => 255
    t.datetime  "alertstatusdt"
    t.string    "fluidstatus",        :limit => 100
    t.text      "admnotes"
    t.datetime  "admsummdt"
    t.text      "admsummhtml"
  end

  add_index "adms", ["admconsultcode"], :name => "admconscode"
  add_index "adms", ["admdate"], :name => "admdate"
  add_index "adms", ["admhospno"], :name => "admhospno"
  add_index "adms", ["admhospno"], :name => "hospno"
  add_index "adms", ["admpid"], :name => "pid"
  add_index "adms", ["clerkedflag"], :name => "clerkedflag"
  add_index "adms", ["currward"], :name => "currward"
  add_index "adms", ["dischdate"], :name => "dischdate"
  add_index "adms", ["dischflag"], :name => "dischflag"
  add_index "adms", ["lastews"], :name => "lastews"
  add_index "adms", ["lastews_id"], :name => "lastewsid"
  add_index "adms", ["visitcode"], :name => "visitcode", :unique => true

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         :default => 0
    t.string   "comment"
    t.string   "remote_address"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], :name => "associated_index"
  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "consultants", :primary_key => "consult_id", :force => true do |t|
    t.string "consultcode",      :limit => 12
    t.string "consultname",      :limit => 30
    t.string "consultlastfirst", :limit => 30
  end

  add_index "consultants", ["consultcode"], :name => "consultcode", :unique => true
  add_index "consultants", ["consultname"], :name => "consultname"

  create_table "custom_patient_lists", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "eventcodes", :id => false, :force => true do |t|
    t.string "eventcode",   :limit => 3
    t.string "eventname",   :limit => 60
    t.string "supportflag", :limit => 0
  end

  add_index "eventcodes", ["eventcode"], :name => "eventcode", :unique => true

  create_table "members", :force => true do |t|
    t.integer "custom_patient_list_id"
    t.integer "patient_id"
  end

  create_table "pats", :primary_key => "pat_id", :force => true do |t|
    t.timestamp "patstamp",                                                                      :null => false
    t.datetime  "pimsmodifdt"
    t.string    "pimslastward",   :limit => 12
    t.date      "patadddate"
    t.datetime  "patmodifdt"
    t.date      "patmodifdate"
    t.string    "hospno",         :limit => 12
    t.string    "prefix",         :limit => 8
    t.string    "lastname",       :limit => 30
    t.string    "firstnames",     :limit => 30
    t.string    "suffix",         :limit => 8
    t.string    "sex",            :limit => 8
    t.date      "birthdate"
    t.string    "ethnicity",      :limit => 24
    t.string    "practicecode",   :limit => 12
    t.string    "gpcode",         :limit => 12
    t.string    "nhsno",          :limit => 12
    t.string    "smoker",         :limit => 24
    t.string    "diabetic",       :limit => 3
    t.string    "allergies"
    t.string    "appliances"
    t.decimal   "heightm",                      :precision => 3, :scale => 2
    t.date      "heightdate"
    t.decimal   "lastweight",                   :precision => 4, :scale => 1
    t.date      "lastweightdate"
    t.decimal   "lastbmi",                      :precision => 3, :scale => 1
    t.decimal   "targetweight",                 :precision => 4, :scale => 1
    t.text      "pastmedhx"
    t.text      "medshx"
    t.text      "socialhx"
    t.string    "patmrsastatus",  :limit => 24
    t.date      "patmrsadate"
    t.string    "deathflag",      :limit => 1
    t.datetime  "deathdt"
    t.boolean   "mergedflag",                                                 :default => false
    t.datetime  "mergeddt"
  end

  add_index "pats", ["hospno"], :name => "hospno", :unique => true
  add_index "pats", ["lastname"], :name => "lastname"
  add_index "pats", ["nhsno"], :name => "nhsno"
  add_index "pats", ["patmrsastatus"], :name => "patmrsastatus"

  create_table "risk_level_events", :force => true do |t|
    t.integer  "patient_id"
    t.string   "risk_level"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "to_do_items", :force => true do |t|
    t.integer  "patient_id"
    t.string   "description"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "status",      :default => "todo"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "wards", :primary_key => "ward_id", :force => true do |t|
    t.string   "wardcode",      :limit => 20,                     :null => false
    t.string   "wardname",      :limit => 60
    t.integer  "wardbeds",      :limit => 1
    t.datetime "wardmodifdt"
    t.datetime "lastwardadmdt"
    t.datetime "lastwardobsdt"
    t.string   "wardbednos",    :limit => 100
    t.string   "handoverspecs", :limit => 100
    t.integer  "ewsalertlevel", :limit => 1,   :default => 0,     :null => false
    t.string   "wardpatcodes",  :limit => 30
    t.text     "wardnotes"
    t.boolean  "termflag",                     :default => false
    t.datetime "termdt"
  end

  add_index "wards", ["wardcode"], :name => "wardcode", :unique => true

end
