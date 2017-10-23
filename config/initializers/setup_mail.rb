if Rails.env.development? || Rails.env.production?
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
        address:        'smtp.sendgrid.net',
        port:           '2525',
        authentication: :plain,
        user_name:      'app77961158@heroku.com',
        password:       'phqgdp860681',
        domain:         'sendgrid.net',
        enable_starttls_auto: true
    }
end