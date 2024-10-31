class Config:
    SQLALCHEMY_DATABASE_URI = 'mysql://root:password@mysql.appointmentscheduler.svc.cluster.local:3306/appointments'
    SQLALCHEMY_TRACK_MODIFICATIONS = False