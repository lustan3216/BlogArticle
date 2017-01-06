has_attached_file :image,
                  styles: { medium: "300x300>", thumb: "100x100>" },
                  default_url: ->(attachment) { ActionController::Base.helpers.asset_path('tmp/a64.png') }