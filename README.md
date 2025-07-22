## users
| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| department_id       | integer | null: false |
| job_num             | integer | null: false |
| email               | string  | null: false, unique |
| encrypted_password  | string  | null: false |
| first_name          | string  | null: false |
| last_name           | string  | null: false |
| first_name_kana     | string  | null: false |
| last_name_kana      | string  | null: false |

### Association
has_many :cars
has_paper_trail



## cars
| Column              | Type        | Options     |
| ------------------- | ----------- | ----------- |
| car_name            | string      | null: false |
| launch_date         | date        | -           |
| user                | references  | null: false, foreign_key: true|

### Association
belongs_to :user
has_many :calculations
has_paper_trail



## calculation
| Column              | Type        | Options     |
| ------------------- | ----------- | ----------- |
| calculation_name    | string      | null: false |
| car                 | references  | null: false, foreign_key: true |

### Association
belongs_to :car
has_many :signals
has_paper_trail



## signalInfos
| Column              | Type        | Options     |
| ------------------- | ----------- | ----------- |
| signal_name         | string      | null: false |
| signal_type_id      | integer     | null: false |
| calculation         | references  | null: false, foreign_key: true |

### Association
belongs_to :calculation
has_paper_trail



## paper_trails

| Column              | Type        | Options     |
| ------------------- | ----------- | ----------- |
| reason              | string      | -           |
| user                | references  | null: false, foreign_key: true |
| car                 | references  | null: false, foreign_key: true |
| calculation         | references  | null: false, foreign_key: true |
| signal              | references  | null: false, foreign_key: true |