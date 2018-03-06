json.extract! user, :id, :first_name, :last_name, :email, :nickname
json.tags user.tags, partial: 'api/v1/tags/detail', as: :tag if user.tags.present?
json.tag_kinds TagKind.all, partial: 'api/v1/tag_kinds/detail', as: :tag_kind
json.chart_accounts current_api_v1_user.chart_accounts, partial: '/api/v1/chart_accounts/detail', as: :chart_account if user.chart_accounts.present?
json.customers user.customers, partial: '/api/v1/customers/detail', as: :customer if user.customers.present?
json.vendors user.vendors, partial: '/api/v1/vendors/detail', as: :vendor if user.vendors.present?