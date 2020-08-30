# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_06_182102) do

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.text "imie_i_nazwisko"
    t.text "email"
    t.text "komentarz"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "kod"
    t.text "tytul"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "poziom"
    t.integer "kategoria"
    t.boolean "ekstra_geste"
    t.boolean "geste"
    t.boolean "rzadkie"
    t.boolean "uniwersalne"
    t.boolean "z_ptfe"
    t.boolean "z_mos2"
    t.boolean "z_grafitem"
    t.boolean "biale"
    t.boolean "do_lozysk"
    t.boolean "do_bram"
    t.boolean "do_dzwigow"
    t.boolean "do_lancuchow"
    t.boolean "do_gumy"
    t.boolean "do_rowerow"
    t.boolean "do_zamkow"
    t.boolean "grafitowo_molibdenowe"
    t.boolean "oleje_precyzyjne_lekkie"
    t.boolean "dla_rolnictwa_i_lesnictwa"
    t.boolean "ochrona_przylaczy"
    t.boolean "kontakt_spray"
    t.boolean "super_izolator"
    t.boolean "zmywacz"
    t.boolean "olej_elektroserwisowy"
    t.boolean "pasty_miedziane"
    t.boolean "ekstra_geste_miedziane"
    t.boolean "pasty_ceramiczne"
    t.boolean "ekstra_geste_ceramiczne"
    t.boolean "pasty_aluminiowe"
    t.boolean "plyny_do_ciecia"
    t.boolean "oleje_do_gwintowania"
    t.boolean "pasty_do_gwintowania"
    t.boolean "odtluszczacz_maszynowy"
    t.boolean "zmywacz_serwisowy"
    t.boolean "zmywacz_smarujacy"
    t.boolean "zmywacz_konserwujacy"
    t.boolean "olej_ochronny"
    t.boolean "wosk_ochronny"
    t.boolean "pasta_ochronna"
    t.boolean "pasta_do_baterii"
    t.boolean "ekstra_gesta_pasta_do_baterii"
    t.boolean "wapniowe"
    t.boolean "smar_plynny"
    t.boolean "smar_polsuchy"
    t.boolean "polsuche_srodki_smarne"
    t.boolean "oleje_wysokoczepne"
    t.boolean "smary_pelzajace"
    t.boolean "plyn_do_oringu"
    t.boolean "pasta_do_oringu"
    t.boolean "ekstra_gesta_pasta_do_oringu"
    t.boolean "spraye_rowerowe"
    t.boolean "zmywacze_rowerowe"
    t.boolean "litowe"
    t.boolean "do_wysiegnikow_alu"
    t.text "tytul_en"
    t.text "tytul_de"
    t.text "tytul_se"
    t.text "tytul_ru"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "volumes", force: :cascade do |t|
    t.integer "product_id", null: false
    t.string "pojemnosc"
    t.decimal "cena", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "waluta"
    t.index ["product_id"], name: "index_volumes_on_product_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "volumes", "products"
end
