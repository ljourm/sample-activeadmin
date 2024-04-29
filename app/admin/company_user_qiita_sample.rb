# app/admin/company_users.rb
ActiveAdmin.register CompanyUser, as: 'CompanyUserQiitaSample' do
  # 1. ヘッダーメニューの並び順
  menu priority: 21

  # 2. 使用可能なアクション一覧
  actions :all, except: [:destroy]

  # 3. 編集可能なカラム名
  permit_params :company_id, :name, :active

  controller do
    # 4. DBからレコードを取得する際の処理を追加
    def scoped_collection
      super.includes(:company)
    end
  end

  # 5. フィルターをRansackの記法でカスタム
  filter :name
  filter :active
  filter :updated_at
  filter :company_id, as: :select, collection: -> { Company.all }
  filter :company_name_cont, label: '会社名 (部分一致)'

  # 6-1. 一覧表示の内容をカスタム
  index do
    selectable_column
    column :id
    column :company_id do |record|
      a href: admin_company_path(record.company) do
        "#{record.company.name}(#{record.company.code})"
      end
    end
    column :name
    column :active
    actions
  end

  # 6-2. 詳細表示の内容をカスタム
  show do
    attributes_table do
      row :id
      row :company_id do |record|
        a href: admin_company_path(record.company) do
          "#{record.company.name}(#{record.company.code})"
        end
      end
      row :name
      row :active
      row :created_at
      row :updated_at
    end
  end

  # 6-3. 編集フォームの内容をカスタム
  form do |f|
    semantic_errors(*object.errors.attribute_names)

    inputs do
      input :company_id, as: :select, collection: Company.all, include_blank: '未選択'
      input :name
      input :active
    end

    actions
  end
end
