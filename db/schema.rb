# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130628112031) do

  create_table "absents", :force => true do |t|
    t.string   "k1s"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "actcards", :force => true do |t|
    t.string   "name"
    t.integer  "order_id"
    t.integer  "user_id"
    t.integer  "quantity"
    t.boolean  "used",       :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "actionitems", :force => true do |t|
    t.integer  "action_id"
    t.string   "pic"
    t.text     "title"
    t.string   "link",       :default => "/act", :null => false
    t.integer  "sort"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "actions", :force => true do |t|
    t.string   "name"
    t.boolean  "auto",       :default => false
    t.integer  "frecuency",  :default => 10,    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "areas", :force => true do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "arina1s", :id => false, :force => true do |t|
    t.string  "k1c"
    t.string  "k11"
    t.integer "tov3_id"
    t.string  "name"
  end

  create_table "atmp", :force => true do |t|
    t.string  "k1s"
    t.text    "name"
    t.text    "fullname"
    t.string  "brend"
    t.string  "absent"
    t.integer "ost"
    t.integer "reserv"
    t.integer "sv_ost"
    t.float   "price",      :limit => 10
    t.string  "k1c_tov3"
    t.string  "tov3"
    t.string  "k1c_tov2"
    t.string  "tov2"
    t.string  "k1c_first1"
    t.string  "first1"
    t.string  "t_type"
    t.integer "q"
    t.string  "kod"
  end

  create_table "bcart1s", :force => true do |t|
    t.integer  "user_id"
    t.string   "k1c"
    t.integer  "bonus_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bcat1s", :force => true do |t|
    t.integer  "cat1_id"
    t.integer  "btg1_id"
    t.string   "k1c"
    t.string   "name"
    t.string   "s1",         :default => "no", :null => false
    t.string   "s2",         :default => "no", :null => false
    t.string   "s3",         :default => "no", :null => false
    t.string   "s4",         :default => "no", :null => false
    t.string   "s5",         :default => "no", :null => false
    t.string   "s6",         :default => "no", :null => false
    t.string   "s7",         :default => "no", :null => false
    t.string   "s8",         :default => "no", :null => false
    t.string   "s9",         :default => "no", :null => false
    t.string   "s10",        :default => "no", :null => false
    t.string   "s11",        :default => "no", :null => false
    t.string   "s12",        :default => "no", :null => false
    t.string   "s13",        :default => "no", :null => false
    t.string   "s14",        :default => "no", :null => false
    t.string   "s15",        :default => "no", :null => false
    t.string   "s16",        :default => "no", :null => false
    t.string   "s17",        :default => "no", :null => false
    t.string   "s18",        :default => "no", :null => false
    t.string   "s19",        :default => "no", :null => false
    t.string   "s20",        :default => "no", :null => false
    t.string   "s21",        :default => "no", :null => false
    t.string   "s22",        :default => "no", :null => false
    t.string   "s23",        :default => "no", :null => false
    t.string   "s24",        :default => "no", :null => false
    t.string   "s25",        :default => "no", :null => false
    t.string   "s26",        :default => "no", :null => false
    t.string   "s27",        :default => "no", :null => false
    t.string   "s28",        :default => "no", :null => false
    t.string   "s29",        :default => "no", :null => false
    t.text     "s30"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bcat1s", ["btg1_id"], :name => "btg1_id"
  add_index "bcat1s", ["s1"], :name => "k1c"

  create_table "bcat1s_copy", :force => true do |t|
    t.integer  "cat1_id"
    t.integer  "btg1_id"
    t.string   "k1c"
    t.string   "name"
    t.string   "s1",         :default => "no", :null => false
    t.string   "s2",         :default => "no", :null => false
    t.string   "s3",         :default => "no", :null => false
    t.string   "s4",         :default => "no", :null => false
    t.string   "s5",         :default => "no", :null => false
    t.string   "s6",         :default => "no", :null => false
    t.string   "s7",         :default => "no", :null => false
    t.string   "s8",         :default => "no", :null => false
    t.string   "s9",         :default => "no", :null => false
    t.string   "s10",        :default => "no", :null => false
    t.string   "s11",        :default => "no", :null => false
    t.string   "s12",        :default => "no", :null => false
    t.string   "s13",        :default => "no", :null => false
    t.string   "s14",        :default => "no", :null => false
    t.string   "s15",        :default => "no", :null => false
    t.string   "s16",        :default => "no", :null => false
    t.string   "s17",        :default => "no", :null => false
    t.string   "s18",        :default => "no", :null => false
    t.string   "s19",        :default => "no", :null => false
    t.string   "s20",        :default => "no", :null => false
    t.string   "s21",        :default => "no", :null => false
    t.string   "s22",        :default => "no", :null => false
    t.string   "s23",        :default => "no", :null => false
    t.string   "s24",        :default => "no", :null => false
    t.string   "s25",        :default => "no", :null => false
    t.string   "s26",        :default => "no", :null => false
    t.string   "s27",        :default => "no", :null => false
    t.string   "s28",        :default => "no", :null => false
    t.string   "s29",        :default => "no", :null => false
    t.text     "s30"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bcat1s_copy", ["btg1_id"], :name => "btg1_id"
  add_index "bcat1s_copy", ["s1"], :name => "k1c"

  create_table "beautycats", :force => true do |t|
    t.string   "k1c"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "room"
  end

  create_table "bonus1s", :force => true do |t|
    t.string  "k1c"
    t.integer "ost"
  end

  add_index "bonus1s", ["k1c"], :name => "k1c"

  create_table "bonus1s_copy", :force => true do |t|
    t.string  "k1c"
    t.integer "ost"
  end

  add_index "bonus1s_copy", ["k1c"], :name => "k1c"

  create_table "bonus1smols", :force => true do |t|
    t.string  "k1c"
    t.integer "ost"
  end

  add_index "bonus1smols", ["k1c"], :name => "k1c"

  create_table "bonus3s", :force => true do |t|
    t.string  "name",        :default => "", :null => false
    t.text    "description",                 :null => false
    t.integer "price",       :default => 0,  :null => false
    t.integer "number",                      :null => false
    t.boolean "spb"
    t.boolean "msk"
    t.boolean "smo"
    t.string  "photo"
    t.string  "k1c"
  end

  create_table "bookings", :force => true do |t|
    t.string "name",           :null => false
    t.string "email",          :null => false
    t.string "phone",          :null => false
    t.string "actions_number", :null => false
  end

  create_table "borders", :force => true do |t|
    t.integer  "user_id"
    t.string   "k1c"
    t.integer  "bonus_price", :limit => 10, :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "btg1hars", :force => true do |t|
    t.integer  "btg1_id"
    t.integer  "s"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "btg1s", :force => true do |t|
    t.string   "reserv"
    t.integer  "tg"
    t.string   "name"
    t.string   "s1",         :default => "no", :null => false
    t.string   "s2",         :default => "no", :null => false
    t.string   "s3",         :default => "no", :null => false
    t.string   "s4",         :default => "no", :null => false
    t.string   "s5",         :default => "no", :null => false
    t.string   "s6",         :default => "no", :null => false
    t.string   "s7",         :default => "no", :null => false
    t.string   "s8",         :default => "no", :null => false
    t.string   "s9",         :default => "no", :null => false
    t.string   "s10",        :default => "no", :null => false
    t.string   "s11",        :default => "no", :null => false
    t.string   "s12",        :default => "no", :null => false
    t.string   "s13",        :default => "no", :null => false
    t.string   "s14",        :default => "no", :null => false
    t.string   "s15",        :default => "no", :null => false
    t.string   "s16",        :default => "no", :null => false
    t.string   "s17",        :default => "no", :null => false
    t.string   "s18",        :default => "no", :null => false
    t.string   "s19",        :default => "no", :null => false
    t.string   "s20",        :default => "no", :null => false
    t.string   "s21",        :default => "no", :null => false
    t.string   "s22",        :default => "no", :null => false
    t.string   "s23",        :default => "no", :null => false
    t.string   "s24",        :default => "no", :null => false
    t.string   "s25",        :default => "no", :null => false
    t.string   "s26",        :default => "no", :null => false
    t.string   "s27",        :default => "no", :null => false
    t.string   "s28",        :default => "no", :null => false
    t.string   "s29",        :default => "no", :null => false
    t.string   "s30",        :default => "no", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "btg1s", ["name"], :name => "name"
  add_index "btg1s", ["reserv"], :name => "reserv"
  add_index "btg1s", ["tg"], :name => "tg"

  create_table "btg1s_copy", :force => true do |t|
    t.string   "reserv"
    t.integer  "tg"
    t.string   "name"
    t.string   "s1",         :default => "no", :null => false
    t.string   "s2",         :default => "no", :null => false
    t.string   "s3",         :default => "no", :null => false
    t.string   "s4",         :default => "no", :null => false
    t.string   "s5",         :default => "no", :null => false
    t.string   "s6",         :default => "no", :null => false
    t.string   "s7",         :default => "no", :null => false
    t.string   "s8",         :default => "no", :null => false
    t.string   "s9",         :default => "no", :null => false
    t.string   "s10",        :default => "no", :null => false
    t.string   "s11",        :default => "no", :null => false
    t.string   "s12",        :default => "no", :null => false
    t.string   "s13",        :default => "no", :null => false
    t.string   "s14",        :default => "no", :null => false
    t.string   "s15",        :default => "no", :null => false
    t.string   "s16",        :default => "no", :null => false
    t.string   "s17",        :default => "no", :null => false
    t.string   "s18",        :default => "no", :null => false
    t.string   "s19",        :default => "no", :null => false
    t.string   "s20",        :default => "no", :null => false
    t.string   "s21",        :default => "no", :null => false
    t.string   "s22",        :default => "no", :null => false
    t.string   "s23",        :default => "no", :null => false
    t.string   "s24",        :default => "no", :null => false
    t.string   "s25",        :default => "no", :null => false
    t.string   "s26",        :default => "no", :null => false
    t.string   "s27",        :default => "no", :null => false
    t.string   "s28",        :default => "no", :null => false
    t.string   "s29",        :default => "no", :null => false
    t.string   "s30",        :default => "no", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "btg1s_copy", ["name"], :name => "name"
  add_index "btg1s_copy", ["reserv"], :name => "reserv"
  add_index "btg1s_copy", ["tg"], :name => "tg"

  create_table "btg1tmps", :force => true do |t|
    t.string   "tov3"
    t.string   "s1"
    t.string   "s2"
    t.string   "s3"
    t.string   "s4"
    t.string   "s5"
    t.string   "s6"
    t.string   "s7"
    t.string   "s8"
    t.string   "s9"
    t.string   "s10"
    t.string   "s11"
    t.string   "s12"
    t.string   "s13"
    t.string   "s14"
    t.string   "s15"
    t.string   "s16"
    t.string   "s17"
    t.string   "s18"
    t.string   "s19"
    t.string   "s20"
    t.string   "s21"
    t.string   "s22"
    t.string   "s23"
    t.string   "s24"
    t.string   "s25"
    t.string   "s26"
    t.string   "s27"
    t.string   "s28"
    t.string   "s29"
    t.string   "s30"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cake1s", :force => true do |t|
    t.string   "name"
    t.text     "opis"
    t.integer  "price",      :limit => 10, :precision => 10, :scale => 0
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "img2"
  end

  create_table "cakecarts", :force => true do |t|
    t.string   "session_id"
    t.integer  "user_id"
    t.integer  "price",      :limit => 10, :precision => 10, :scale => 0
    t.integer  "quantity"
    t.integer  "weight"
    t.integer  "cake1_id"
    t.integer  "filler1_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cakeorder1s", :force => true do |t|
    t.string   "phone"
    t.string   "name"
    t.text     "adres"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "weight"
    t.integer  "quantity"
  end

  create_table "cartgifts", :force => true do |t|
    t.integer  "user_id"
    t.string   "k1c"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", :force => true do |t|
    t.string   "Sesion_id"
    t.integer  "User_id"
    t.string   "k1s"
    t.float    "price"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "otdel",      :limit => 20
    t.integer  "user"
    t.integer  "user1_id"
  end

  add_index "carts", ["Sesion_id"], :name => "session"
  add_index "carts", ["User_id"], :name => "user_id"
  add_index "carts", ["k1s"], :name => "k1s"

  create_table "carts_copy", :force => true do |t|
    t.string   "Sesion_id"
    t.integer  "User_id"
    t.string   "k1s"
    t.float    "price"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "otdel",      :limit => 20
    t.integer  "user"
    t.integer  "user1_id"
  end

  add_index "carts_copy", ["k1s"], :name => "k1s"

  create_table "cat1imgs", :force => true do |t|
    t.integer  "cat1_id"
    t.string   "pic"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cat1s", :force => true do |t|
    t.integer  "tov3_id"
    t.string   "k1c"
    t.string   "kpk"
    t.string   "arppr"
    t.string   "tg"
    t.integer  "portg"
    t.text     "fullname"
    t.string   "name"
    t.string   "brend"
    t.string   "subbrend"
    t.string   "pic1"
    t.string   "status",        :limit => 100
    t.string   "pic2"
    t.string   "ei"
    t.float    "price"
    t.integer  "collection_id"
    t.integer  "tg1"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "o1s"
    t.string   "o2s"
    t.integer  "delivery"
    t.boolean  "vis",                          :default => true
    t.string   "dop"
    t.string   "k11"
    t.boolean  "podarok"
    t.string   "sign"
    t.string   "comp"
    t.integer  "st"
    t.integer  "opt"
    t.integer  "raspr",         :limit => 1,   :default => 0,    :null => false
    t.boolean  "spb"
    t.boolean  "msk"
  end

  add_index "cat1s", ["k1c"], :name => "k1c"
  add_index "cat1s", ["tov3_id"], :name => "tov3"

  create_table "cat1s_copy", :force => true do |t|
    t.integer  "tov3_id"
    t.string   "k1c"
    t.string   "kpk"
    t.string   "arppr"
    t.string   "tg"
    t.integer  "portg"
    t.text     "fullname"
    t.string   "name"
    t.string   "brend"
    t.string   "subbrend"
    t.string   "pic1"
    t.string   "status",        :limit => 100
    t.string   "pic2"
    t.string   "ei"
    t.float    "price"
    t.integer  "collection_id"
    t.integer  "tg1"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "o1s"
    t.string   "o2s"
    t.integer  "delivery"
    t.boolean  "vis",                          :default => true
    t.string   "dop"
    t.string   "k11"
    t.boolean  "podarok"
    t.string   "sign"
    t.string   "comp"
    t.integer  "st"
    t.integer  "opt"
    t.boolean  "raspr",                        :default => false
    t.boolean  "spb"
    t.boolean  "msk"
  end

  add_index "cat1s_copy", ["k1c"], :name => "k1c"
  add_index "cat1s_copy", ["tov3_id"], :name => "tov3"

  create_table "catcods", :force => true do |t|
    t.integer  "kod"
    t.boolean  "used",       :default => false, :null => false
    t.integer  "user_id"
    t.integer  "zakaz"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cats", :force => true do |t|
    t.integer  "g3_id"
    t.string   "name"
    t.string   "color"
    t.string   "format"
    t.string   "kl"
    t.string   "brend"
    t.string   "subbrend"
    t.string   "pic1"
    t.string   "pic2"
    t.text     "opis"
    t.string   "ei"
    t.decimal  "price",      :precision => 10, :scale => 2
    t.integer  "tu"
    t.decimal  "pricetu",    :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ktver"
    t.string   "k1c"
    t.string   "kpk"
    t.string   "kkom"
    t.string   "kkont"
    t.string   "kprod"
    t.string   "arppr"
    t.string   "tg"
    t.string   "tg1"
  end

  create_table "cities", :force => true do |t|
    t.string "name"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                                 :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 25
    t.string   "guid",              :limit => 10
    t.integer  "locale",            :limit => 1,  :default => 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "fk_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_assetable_type"
  add_index "ckeditor_assets", ["user_id"], :name => "fk_user"

  create_table "clients", :force => true do |t|
    t.string  "k1c"
    t.string  "name"
    t.string  "inn"
    t.string  "kpp"
    t.string  "fullname"
    t.integer "manager"
    t.integer "holding_id"
  end

  create_table "clms", :force => true do |t|
    t.string  "k1c"
    t.integer "client_id",   :default => 0, :null => false
    t.string  "column4"
    t.string  "client"
    t.integer "manager1_id"
    t.string  "m2"
  end

  create_table "collections", :force => true do |t|
    t.integer  "cat1_id"
    t.string   "k1c"
    t.boolean  "collection"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comics1s", :force => true do |t|
    t.integer  "user_id"
    t.text     "message"
    t.integer  "adv"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "contacts"
  end

  create_table "comix1s", :force => true do |t|
    t.string   "pic"
    t.integer  "com_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "confirms", :force => true do |t|
    t.integer  "user_id"
    t.string   "rnd"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consultations", :force => true do |t|
    t.string "name",  :null => false
    t.string "phone", :null => false
    t.string "email", :null => false
  end

  create_table "data_files", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "desk_answs", :force => true do |t|
    t.integer  "desk_subj_id"
    t.text     "a_text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "desk_subjs", :force => true do |t|
    t.text     "subj"
    t.text     "s_text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deskavatars", :force => true do |t|
    t.string   "img"
    t.integer  "deskprofile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "redaktor"
  end

  create_table "deskprofs", :force => true do |t|
    t.integer  "user_id"
    t.string   "nic"
    t.string   "job"
    t.integer  "picture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", :force => true do |t|
    t.integer  "user_id"
    t.text     "msg"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ff1s", :force => true do |t|
    t.integer "user_id", :null => false
    t.integer "ff_id",   :null => false
    t.string  "todo"
  end

  create_table "filler1s", :force => true do |t|
    t.string   "name"
    t.text     "opis"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "first1s", :force => true do |t|
    t.integer  "kod"
    t.string   "name"
    t.string   "name1"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "razdel1_id"
  end

  create_table "first1s_22_01_13", :force => true do |t|
    t.integer  "kod"
    t.string   "name"
    t.string   "name1"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "first1s_copy2", :force => true do |t|
    t.integer  "kod"
    t.string   "name"
    t.string   "name1"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foo1s", :force => true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "forwarders", :force => true do |t|
    t.string   "name"
    t.string   "img_url"
    t.integer  "point"
    t.string   "gift"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "funnygoods", :force => true do |t|
    t.string   "k1c"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gifts", :force => true do |t|
    t.string   "k1c"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "holiday_id"
  end

  create_table "hartmps", :force => true do |t|
    t.string   "tov3"
    t.string   "name"
    t.string   "s1"
    t.string   "s2"
    t.string   "s3"
    t.string   "s4"
    t.string   "s5"
    t.string   "s6"
    t.string   "s7"
    t.string   "s8"
    t.string   "s9"
    t.string   "s10"
    t.string   "s11"
    t.string   "s12"
    t.string   "s13"
    t.string   "s14"
    t.string   "s15"
    t.string   "s16"
    t.string   "s17"
    t.string   "s18"
    t.string   "s19"
    t.string   "s20"
    t.string   "s21"
    t.string   "s22"
    t.string   "s23"
    t.string   "s24"
    t.string   "s25"
    t.string   "s26"
    t.string   "s27"
    t.string   "s28"
    t.string   "s29"
    t.text     "s30"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "helpers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "manager_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "holding1s", :force => true do |t|
    t.string   "name"
    t.string   "glav"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "holidays", :force => true do |t|
    t.integer  "month"
    t.integer  "day"
    t.text     "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "indexnews", :force => true do |t|
    t.text     "new"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "infos", :force => true do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.string   "name"
    t.string   "job"
    t.string   "sex"
    t.string   "date_birth"
    t.text     "children"
    t.string   "mail"
    t.string   "m_phone"
    t.string   "category"
    t.string   "site"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ists", :force => true do |t|
    t.string   "k1s"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       :limit => 100
    t.integer  "order"
    t.integer  "por"
  end

  create_table "its", :force => true do |t|
    t.integer  "user_id"
    t.string   "k1c"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tg3"
    t.integer  "tg2"
    t.integer  "tg1"
    t.integer  "kod_f1"
    t.string   "brend",      :limit => 50
  end

  create_table "its_copy", :force => true do |t|
    t.integer  "user_id"
    t.string   "k1c"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tg3"
    t.integer  "tg2"
    t.integer  "tg1"
    t.integer  "kod_f1"
    t.string   "brend",      :limit => 50
  end

  create_table "katalogs", :id => false, :force => true do |t|
    t.string "k1c"
    t.string "kod"
  end

  create_table "katr11s", :id => false, :force => true do |t|
    t.string "k1c"
    t.string "Артикул"
    t.string "Наименование"
    t.string "Фирма изготовитель"
    t.float  "Из базы_Код",                :limit => 10
    t.float  "id",                                  :limit => 10
    t.string "k1c_s"
    t.string "name"
    t.string "artikul"
  end

  create_table "katr12s", :id => false, :force => true do |t|
    t.float  "id",                       :limit => 10
    t.string "k1c_s"
    t.string "name"
    t.string "artikul"
    t.string "k1c"
    t.string "Артикул"
    t.string "Наименование"
  end

  create_table "katrprics", :id => false, :force => true do |t|
    t.string "k1c"
    t.string "Номенклатура"
    t.float  "price",                    :limit => 10
  end

  create_table "keit_carts", :force => true do |t|
    t.integer  "user_id"
    t.string   "session_id"
    t.integer  "price",        :limit => 10, :precision => 10, :scale => 0
    t.string   "name"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "keitering_id"
  end

  create_table "keiterings", :force => true do |t|
    t.string   "name"
    t.text     "opis"
    t.string   "weight"
    t.integer  "price",      :limit => 10, :precision => 10, :scale => 0
    t.string   "prw"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "sets"
  end

  create_table "kodopis1s", :id => false, :force => true do |t|
    t.string  "k1c"
    t.string  "k11"
    t.integer "tov3_id"
    t.string  "name"
    t.text    "opis"
  end

  create_table "konkurs1s", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "breef"
    t.string   "mail"
  end

  create_table "konkursimgs", :force => true do |t|
    t.integer  "konkurs1_id"
    t.string   "prw"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "konkursitems", :force => true do |t|
    t.integer  "konkursorder_id"
    t.string   "k1s"
    t.integer  "quantity"
    t.float    "price"
    t.string   "otdel"
    t.integer  "user1_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "konkursorders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kontragents", :force => true do |t|
    t.string   "k1c"
    t.string   "kod_m"
    t.string   "manager"
    t.string   "mail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kontragents_copy", :force => true do |t|
    t.string   "k1c"
    t.string   "kod_m"
    t.string   "manager"
    t.string   "mail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "korders", :force => true do |t|
    t.string   "phone"
    t.text     "adres"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "legals", :force => true do |t|
    t.string   "name"
    t.string   "ofp"
    t.string   "inn"
    t.string   "kpp"
    t.string   "ps"
    t.integer  "bank_id"
    t.string   "ubp"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
  end

  create_table "licakeorders", :force => true do |t|
    t.integer  "cakeorder1_id"
    t.integer  "cake1_id"
    t.integer  "filler1_id"
    t.integer  "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
  end

  create_table "likeits", :force => true do |t|
    t.integer  "korder_id"
    t.integer  "keitering_id"
    t.integer  "quantity"
    t.integer  "price",        :limit => 10, :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lineitems", :force => true do |t|
    t.integer  "order_id"
    t.string   "k1c"
    t.integer  "quantity"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "otdel",      :limit => 20
    t.integer  "user1_id"
  end

  add_index "lineitems", ["order_id"], :name => "order_id"

  create_table "liwater1s", :force => true do |t|
    t.integer  "worder_id"
    t.integer  "water1_id"
    t.integer  "wdisp_id"
    t.integer  "wquantity"
    t.integer  "dquantity"
    t.integer  "price",      :limit => 10, :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "m_company", :force => true do |t|
    t.integer "userid",                :default => 0,  :null => false
    t.string  "company",               :default => "", :null => false
    t.integer "bonus1",                :default => 0,  :null => false
    t.integer "bonus2",                :default => 0,  :null => false
    t.integer "bonus",                 :default => 0,  :null => false
    t.string  "inn",     :limit => 12, :default => "", :null => false
    t.string  "address",               :default => "", :null => false
    t.string  "phone",                 :default => "", :null => false
    t.string  "bank",                  :default => "", :null => false
    t.string  "rschet",                :default => "", :null => false
    t.string  "kschet",                :default => "", :null => false
    t.string  "bik",                   :default => "", :null => false
    t.integer "price",                 :default => 0,  :null => false
    t.string  "status",  :limit => 1
    t.integer "manager"
  end

  create_table "m_users", :force => true do |t|
    t.string "name",     :default => "",           :null => false
    t.string "password", :default => "",           :null => false
    t.string "fio",      :default => "",           :null => false
    t.string "email",    :default => "",           :null => false
    t.date   "date",     :default => '2008-10-01', :null => false
  end

  create_table "managers", :force => true do |t|
    t.string  "name",    :limit => 100
    t.string  "email",   :limit => 100
    t.integer "user_id"
  end

  create_table "mcarts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "manager1_id"
    t.string   "k1c"
    t.float    "price"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mcontent1s", :force => true do |t|
    t.integer  "messager_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "messagers", :force => true do |t|
    t.date     "data"
    t.integer  "user_id"
    t.integer  "pc",         :default => 1, :null => false
    t.string   "session_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "content"
  end

  create_table "messu1s", :force => true do |t|
    t.string   "name"
    t.integer  "present"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mm1s", :force => true do |t|
    t.integer  "user_id"
    t.integer  "manager1_id"
    t.string   "title"
    t.string   "mess"
    t.string   "r1"
    t.string   "r2"
    t.integer  "r3"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "text"
  end

  create_table "needs", :force => true do |t|
    t.string   "title"
    t.integer  "quantity"
    t.string   "link"
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "brend"
    t.string   "user_f"
    t.text     "description"
    t.string   "company_ind"
  end

  create_table "news_items", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.text     "body"
    t.boolean  "visible"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newspics", :force => true do |t|
    t.integer  "news_id"
    t.string   "img_sm"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newyears", :force => true do |t|
    t.string   "k1c"
    t.decimal  "price",      :precision => 10, :scale => 2
    t.decimal  "old_price",  :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nprice1s", :force => true do |t|
    t.string  "k1c"
    t.string  "Column1"
    t.string  "Column2"
    t.float   "p1_old",  :limit => 10
    t.float   "pp",      :limit => 10
    t.float   "m3",      :limit => 10
    t.float   "m5",      :limit => 10
    t.float   "m7",      :limit => 10
    t.float   "m10",     :limit => 10
    t.float   "z2",      :limit => 10
    t.integer "bonus"
    t.string  "k11"
    t.float   "p1_bn",   :limit => 10
    t.float   "pp_bn",   :limit => 10
    t.float   "m3_bn",   :limit => 10
    t.float   "m5_bn",   :limit => 10
    t.float   "m7_bn",   :limit => 10
    t.float   "m10_bn",  :limit => 10
    t.float   "z2_bn",   :limit => 10
  end

  create_table "nprice1s_copy", :force => true do |t|
    t.string  "k1c"
    t.string  "Column1"
    t.string  "Column2"
    t.float   "p1_old",  :limit => 10
    t.float   "pp",      :limit => 10
    t.float   "m3",      :limit => 10
    t.float   "m5",      :limit => 10
    t.float   "m7",      :limit => 10
    t.float   "m10",     :limit => 10
    t.float   "z2",      :limit => 10
    t.integer "bonus"
    t.string  "k11"
    t.float   "p1_bn",   :limit => 10
    t.float   "pp_bn",   :limit => 10
    t.float   "m3_bn",   :limit => 10
    t.float   "m5_bn",   :limit => 10
    t.float   "m7_bn",   :limit => 10
    t.float   "m10_bn",  :limit => 10
    t.float   "z2_bn",   :limit => 10
  end

  create_table "oldprices", :force => true do |t|
    t.string   "k1c"
    t.decimal  "price",      :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.integer  "legal_id"
    t.integer  "adr_dost_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "data_dost",   :limit => 30
    t.string   "status",      :limit => 50
    t.string   "opl",         :limit => 20
    t.string   "dost",        :limit => 20
    t.float    "summa"
    t.integer  "city"
    t.text     "dop"
    t.integer  "user1_id"
  end

  create_table "orders_copy2", :force => true do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.integer  "legal_id"
    t.integer  "adr_dost_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "data_dost",   :limit => 30
    t.string   "status",      :limit => 50
    t.string   "opl",         :limit => 20
    t.string   "dost",        :limit => 20
    t.float    "summa"
    t.integer  "city"
    t.text     "dop"
    t.integer  "user1_id"
  end

  create_table "pictures", :force => true do |t|
    t.integer  "desk_subj_id"
    t.string   "comment"
    t.string   "name"
    t.string   "content_type"
    t.binary   "data",         :limit => 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "redaktor"
    t.integer  "deskprof_id"
  end

  create_table "podvals", :force => true do |t|
    t.string   "title"
    t.string   "divup"
    t.string   "divdown"
    t.integer  "tov1_id"
    t.integer  "tov2_id"
    t.integer  "tov4_id"
    t.integer  "tov3_id"
    t.integer  "tov5_id"
    t.string   "tov1name"
    t.string   "tov2name"
    t.string   "tov3name"
    t.string   "tov2img"
    t.string   "tov4name"
    t.string   "tov5name"
    t.string   "tov1img"
    t.string   "tov4img"
    t.string   "tov3img"
    t.string   "tov5img"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.boolean  "vis"
    t.integer  "main",        :limit => 1, :default => 0
    t.string   "name_color",               :default => "#1E90FF"
    t.string   "price_color",              :default => "#FF8C00"
  end

  create_table "printerrashes", :force => true do |t|
    t.integer  "printer_id"
    t.integer  "rashod_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "printers", :force => true do |t|
    t.string   "name"
    t.string   "ur_null"
    t.string   "brend"
    t.integer  "por_brend"
    t.string   "ur_3"
    t.integer  "por_ur_3"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questionansws", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "user_answ"
    t.integer  "q_id"
    t.string   "variant"
    t.string   "session_id"
  end

  create_table "questions", :force => true do |t|
    t.text     "qestion"
    t.text     "answ1"
    t.text     "answ2"
    t.text     "answ3"
    t.text     "answ4"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rashods", :force => true do |t|
    t.string   "k1c"
    t.string   "name_tov"
    t.string   "name"
    t.string   "brend"
    t.string   "artikul"
    t.string   "kod_0"
    t.string   "pic1"
    t.string   "details"
    t.string   "kod_1"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "vis",                      :default => true,    :null => false
    t.string   "u_dost",     :limit => 20
    t.float    "price",                    :default => 1.0
    t.string   "kpk"
    t.string   "ei",         :limit => 20, :default => "шт."
  end

  create_table "raspr1s", :force => true do |t|
    t.string   "k1c"
    t.string   "name"
    t.string   "img_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
    t.string   "tov3"
    t.string   "brend"
  end

  create_table "rassilkas", :force => true do |t|
    t.string   "mail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "razdel1s", :force => true do |t|
    t.string   "name"
    t.string   "link"
    t.integer  "top",        :limit => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "razdel1s_22_01_13", :force => true do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receiveds", :force => true do |t|
    t.integer  "number"
    t.string   "mail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sale_actions", :force => true do |t|
    t.string   "image"
    t.string   "header",     :null => false
    t.text     "body",       :null => false
    t.string   "note"
    t.string   "link"
    t.integer  "position",   :null => false
    t.boolean  "visibility", :null => false
    t.string   "city_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales", :force => true do |t|
    t.string   "k1c"
    t.decimal  "price",      :precision => 10, :scale => 2
    t.decimal  "old_price",  :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "spb"
    t.integer  "msk"
  end

  create_table "saletmps", :force => true do |t|
    t.string   "k1c"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",      :precision => 10, :scale => 2
  end

  create_table "secrets", :force => true do |t|
    t.integer  "user_id"
    t.text     "secret"
    t.string   "name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "mail"
    t.string   "company_ind"
    t.string   "city"
    t.boolean  "vis",         :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sertificats", :force => true do |t|
    t.string   "k1c"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", :force => true do |t|
    t.string   "title"
    t.boolean  "flag"
    t.integer  "code",       :default => 0
    t.integer  "code2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "set1s", :force => true do |t|
    t.integer  "keitering_id"
    t.string   "name"
    t.text     "opis"
    t.string   "weight"
    t.integer  "price",        :limit => 10, :precision => 10, :scale => 0
    t.string   "prw"
    t.string   "img"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "set_items", :force => true do |t|
    t.integer  "cat1_id"
    t.string   "k1c"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sinonims", :id => false, :force => true do |t|
    t.integer "id",    :limit => 8
    t.string  "k1c"
    t.string  "tg"
    t.string  "name"
    t.string  "brend"
    t.string  "dop"
  end

  create_table "spetzpredls", :force => true do |t|
    t.string   "k1c"
    t.integer  "ost"
    t.boolean  "spb_msk"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statps", :force => true do |t|
    t.string   "title"
    t.string   "name"
    t.text     "content",    :limit => 2147483647
    t.string   "rezerv"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tag_clouds", :force => true do |t|
    t.string  "name"
    t.string  "link"
    t.string  "styleTag"
    t.integer "category"
    t.integer "por"
  end

  create_table "temps", :force => true do |t|
    t.integer  "kod"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tov2s", :force => true do |t|
    t.integer  "first1_id"
    t.string   "name"
    t.string   "hk"
    t.string   "reserv"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ord"
    t.string   "all"
  end

  create_table "tov2s_copy", :force => true do |t|
    t.integer  "first1_id"
    t.string   "name"
    t.string   "hk"
    t.string   "reserv"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ord"
    t.string   "all"
  end

  create_table "tov3s", :force => true do |t|
    t.integer  "tov2_id"
    t.string   "name"
    t.string   "hk"
    t.string   "reserv"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ord"
    t.boolean  "vis",        :default => true, :null => false
  end

  create_table "tov3s_copy", :force => true do |t|
    t.integer  "tov2_id"
    t.string   "name"
    t.string   "hk"
    t.string   "reserv"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ord"
    t.boolean  "vis",        :default => true, :null => false
  end

  create_table "tov_specs", :force => true do |t|
    t.integer  "user_id"
    t.string   "k1c"
    t.decimal  "price_spec",               :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "legal_id"
    t.string   "brend",      :limit => 50
    t.integer  "tg1"
    t.integer  "tg2"
    t.integer  "tg3"
    t.integer  "kod_f1"
  end

  create_table "users", :force => true do |t|
    t.string   "scr_name"
    t.string   "patronymic"
    t.string   "surname",                                                                         :null => false
    t.string   "phone"
    t.string   "m_phone"
    t.integer  "head",            :limit => 1,                                :default => 0,      :null => false
    t.integer  "head_id"
    t.boolean  "buy",                                                         :default => false,  :null => false
    t.boolean  "bonus",                                                       :default => false
    t.string   "company_ind"
    t.string   "ip"
    t.string   "role2",                                                       :default => "user", :null => false
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "mail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
    t.integer  "email_confirm",                                               :default => 0
    t.boolean  "soglasen",                                                                        :null => false
    t.boolean  "autologin",                                                   :default => false,  :null => false
    t.string   "inn"
    t.boolean  "only_specs",                                                  :default => false,  :null => false
    t.integer  "client1_id",                                                  :default => 0,      :null => false
    t.string   "role",                                                        :default => "user", :null => false
    t.integer  "price"
    t.string   "price1",                                                      :default => "pp"
    t.string   "otdel"
    t.decimal  "limit",                        :precision => 10, :scale => 2
    t.string   "role3"
    t.string   "city"
    t.integer  "ref"
    t.string   "rout_name"
    t.string   "rout_link"
  end

  create_table "users_copy", :force => true do |t|
    t.string   "scr_name"
    t.string   "patronymic"
    t.string   "surname"
    t.string   "phone"
    t.string   "m_phone"
    t.integer  "head",            :limit => 1,                                :default => 0,      :null => false
    t.integer  "head_id"
    t.boolean  "buy",                                                         :default => false,  :null => false
    t.boolean  "bonus",                                                       :default => false
    t.string   "company_ind"
    t.string   "ip"
    t.string   "role2",                                                       :default => "user", :null => false
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "mail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "client_id"
    t.integer  "email_confirm",                                               :default => 0
    t.boolean  "soglasen",                                                                        :null => false
    t.boolean  "autologin",                                                   :default => false,  :null => false
    t.string   "inn"
    t.integer  "old_id",                                                      :default => 0,      :null => false
    t.integer  "client1_id",                                                  :default => 0,      :null => false
    t.string   "role",                                                        :default => "user", :null => false
    t.integer  "price"
    t.string   "price1",                                                      :default => "pp"
    t.string   "otdel"
    t.decimal  "limit",                        :precision => 10, :scale => 2
    t.string   "role3"
    t.string   "city"
    t.integer  "ref"
    t.string   "rout_name"
    t.string   "rout_link"
  end

  create_table "vacancies", :force => true do |t|
    t.string   "profession"
    t.string   "experience"
    t.string   "education"
    t.string   "shedule"
    t.text     "duties"
    t.text     "requirements"
    t.text     "conditions"
    t.string   "preference"
    t.string   "city"
    t.string   "paiment"
    t.string   "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vict_users_qs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "id_question"
    t.integer  "user_answ"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "right"
  end

  create_table "victor_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "right"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "win"
  end

  create_table "victorinas", :force => true do |t|
    t.text     "question"
    t.integer  "right_q"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "answ1"
    t.text     "answ2"
    t.text     "answ3"
  end

  create_table "water1s", :force => true do |t|
    t.string   "name"
    t.text     "opis"
    t.string   "img"
    t.integer  "p1",         :limit => 10, :precision => 10, :scale => 0
    t.integer  "p2",         :limit => 10, :precision => 10, :scale => 0
    t.integer  "p3",         :limit => 10, :precision => 10, :scale => 0
    t.integer  "p4",         :limit => 10, :precision => 10, :scale => 0
    t.integer  "p5",         :limit => 10, :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sert"
  end

  create_table "wcarts", :force => true do |t|
    t.string   "session_id"
    t.integer  "user_id"
    t.integer  "price",      :limit => 10, :precision => 10, :scale => 0
    t.integer  "wdisp_id"
    t.integer  "water1_id"
    t.integer  "wquantity"
    t.integer  "dquantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wdisps", :force => true do |t|
    t.string   "name"
    t.text     "opis"
    t.string   "img"
    t.integer  "price",      :limit => 10, :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "worders", :force => true do |t|
    t.string   "phone"
    t.text     "adres"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "zakaz_catalogs", :force => true do |t|
    t.string   "adres"
    t.string   "tel"
    t.string   "fio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.string   "c_name"
  end

  create_table "zakazp1s", :force => true do |t|
    t.string   "adres"
    t.string   "tel"
    t.string   "fio"
    t.string   "city"
    t.string   "c_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "zz1s", :force => true do |t|
    t.string   "company"
    t.string   "phone"
    t.string   "name"
    t.string   "otvet"
    t.integer  "otvet1"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "quest"
    t.string   "m"
    t.string   "mmail"
  end

end
