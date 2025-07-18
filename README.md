## users
| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| department_id       | integer | null: false |
| number              | integer | null: false |
| email               | string  | null: false, unique |
| encrypted_password  | string  | null: false |
| first_name          | string  | null: false |
| last_name           | string  | null: false |
| first_name_kana     | string  | null: false |
| last_name_kana      | string  | null: false |

### Association
has_many :cars
has_many :records



## cars
| Column              | Type        | Options     |
| ------------------- | ----------- | ----------- |
| car_name            | string      | null: false |
| launch_date         | date        | null: false |
| calculation         | string      | null: false |
| user                | references  | null: false, foreign_key: true|

### Association
has_many :records
belongs_to :user



## calculation
| Column              | Type        | Options     |
| ------------------- | ----------- | ----------- |
| calculation_name    | string      | null: false |
| car                 | references  | null: false, foreign_key: true |

### Association
has_many :signals
has_many :records
belongs_to :car



## signals
| Column              | Type        | Options     |
| ------------------- | ----------- | ----------- |
| signal_name         | string      | null: false |
| signal_type_id      | integer     | null: false |
| calculation         | references  | null: false, foreign_key: true |

### Association
has_many :records
belongs_to :calculation



## records

| Column              | Type        | Options     |
| ------------------- | ----------- | ----------- |
| record              | string      | null: false |
| change_reason       | string      | -           |
| user                | references  | null: false, foreign_key: true |
| car                 | references  | null: false, foreign_key: true |
| calculation         | references  | null: false, foreign_key: true |
| signal              | references  | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :car
belongs_to :calculation
belongs_to :signal