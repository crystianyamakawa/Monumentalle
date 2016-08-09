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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151202211415) do

  create_table "clientes", force: :cascade do |t|
    t.string   "nome",          limit: 255
    t.string   "nr_telefone",   limit: 255
    t.string   "nr_telefone2",  limit: 255
    t.date     "dt_nascimento"
    t.string   "nr_documento",  limit: 255
    t.string   "tp_documento",  limit: 255
    t.string   "nr_cpf_cnpj",   limit: 255
    t.string   "rua",           limit: 255
    t.string   "complemento",   limit: 255
    t.string   "numero",        limit: 255
    t.string   "bairro",        limit: 255
    t.string   "cidade",        limit: 255
    t.string   "uf",            limit: 255
    t.string   "cep",           limit: 255
    t.text     "obs",           limit: 65535
    t.string   "created_by",    limit: 255
    t.string   "updated_by",    limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "contrato_produtos", force: :cascade do |t|
    t.integer  "contrato_id",  limit: 4
    t.integer  "produto_id",   limit: 4
    t.integer  "quantidade",   limit: 4
    t.float    "vl_tabela",    limit: 24
    t.float    "vl_negociado", limit: 24
    t.datetime "dt_inicio"
    t.datetime "dt_termino"
    t.string   "created_by",   limit: 255
    t.string   "updated_by",   limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "contrato_produtos", ["contrato_id", "produto_id"], name: "index_contrato_produtos_on_contrato_id_and_produto_id", using: :btree

  create_table "contratos", force: :cascade do |t|
    t.string   "descricao",    limit: 255
    t.integer  "cliente_id",   limit: 4
    t.string   "tp_evento",    limit: 255
    t.date     "dt_evento"
    t.datetime "dt_inicio"
    t.datetime "dt_termino"
    t.string   "status",       limit: 255
    t.decimal  "vl_negociado",               precision: 15, scale: 2
    t.string   "vl_extenso",   limit: 255
    t.text     "obs",          limit: 65535
    t.string   "created_by",   limit: 255
    t.string   "updated_by",   limit: 255
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "contratos", ["cliente_id"], name: "index_contratos_on_cliente_id", using: :btree

  create_table "despesas", force: :cascade do |t|
    t.string   "nome",          limit: 255
    t.string   "tp_despesa",    limit: 255
    t.integer  "contrato_id",   limit: 4
    t.integer  "fornecedor_id", limit: 4
    t.decimal  "vl_despesa",                  precision: 15, scale: 2
    t.string   "status",        limit: 255
    t.date     "dt_executado"
    t.float    "vl_executado",  limit: 24
    t.text     "obs",           limit: 65535
    t.string   "created_by",    limit: 255
    t.string   "updated_by",    limit: 255
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  create_table "eventos", force: :cascade do |t|
    t.date     "dt_evento"
    t.datetime "dt_inicio"
    t.datetime "dt_termino"
    t.string   "created_by",  limit: 255
    t.string   "update_by",   limit: 255
    t.text     "obs",         limit: 65535
    t.string   "tp_evento",   limit: 255
    t.string   "status",      limit: 255
    t.integer  "sinc_google", limit: 4
    t.datetime "dt_sinc"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "fechamento_caixas", force: :cascade do |t|
    t.date     "periodo"
    t.integer  "fin_conta_id", limit: 4
    t.decimal  "vl_saldo",                 precision: 15, scale: 2
    t.string   "created_by",   limit: 255
    t.string   "updated_by",   limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  create_table "fin_conta", force: :cascade do |t|
    t.string   "descricao",  limit: 255
    t.string   "banco",      limit: 255
    t.string   "agencia",    limit: 255
    t.string   "conta",      limit: 255
    t.decimal  "saldo",                    precision: 15, scale: 2
    t.string   "status",     limit: 255
    t.text     "obs",        limit: 65535
    t.string   "created_by", limit: 255
    t.string   "updated_by", limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  create_table "fin_movimentos", force: :cascade do |t|
    t.string   "tp_movimento",  limit: 255
    t.string   "descricao",     limit: 255
    t.decimal  "valor",                       precision: 15, scale: 2
    t.string   "status",        limit: 255
    t.string   "motivo_status", limit: 255
    t.date     "dt_previsto"
    t.string   "dt_executado",  limit: 255
    t.integer  "contrato_id",   limit: 4
    t.integer  "fin_conta_id",  limit: 4
    t.integer  "despesa_id",    limit: 4
    t.text     "obs",           limit: 65535
    t.string   "created_by",    limit: 255
    t.string   "updated_by",    limit: 255
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  add_index "fin_movimentos", ["contrato_id"], name: "index_fin_movimentos_on_contrato_id", using: :btree
  add_index "fin_movimentos", ["despesa_id"], name: "index_fin_movimentos_on_despesa_id", using: :btree

  create_table "fornecedors", force: :cascade do |t|
    t.string   "nome",         limit: 255
    t.string   "nr_telefone",  limit: 255
    t.string   "nr_telefone2", limit: 255
    t.text     "obs",          limit: 65535
    t.string   "contato",      limit: 255
    t.string   "rua",          limit: 255
    t.string   "nr_endereco",  limit: 255
    t.string   "bairro",       limit: 255
    t.string   "cidade",       limit: 255
    t.string   "cep",          limit: 255
    t.string   "uf",           limit: 255
    t.string   "created_by",   limit: 255
    t.string   "updated_by",   limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "produtos", force: :cascade do |t|
    t.string   "descricao",  limit: 255
    t.float    "valor",      limit: 24
    t.text     "obs",        limit: 65535
    t.string   "created_by", limit: 255
    t.string   "updated_by", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 25
    t.string   "last_name",              limit: 50
    t.string   "username",               limit: 25,  default: "", null: false
    t.string   "hashed_password",        limit: 25,  default: "", null: false
    t.string   "email",                  limit: 100, default: "", null: false
    t.string   "password",               limit: 40
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "token",                  limit: 255
    t.string   "uid",                    limit: 255
    t.string   ":provider",              limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
