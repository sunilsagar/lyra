# this file is generated
type Example = TypeSet[{
  pcore_uri => 'http://puppet.com/2016.1/pcore',
  pcore_version => '1.0.0',
  name_authority => 'http://puppet.com/2016.1/runtime',
  name => 'Example',
  version => '0.1.0',
  types => {
    Address => {
      attributes => {
        'lineOne' => {
          'type' => String,
          'value' => ''
        }
      }
    },
    ContainedRes => {
      annotations => {
        Lyra::Resource => {
          'providedAttributes' => ['id'],
          'relationships' => {
            'owner' => {
              'type' => OwnerRes,
              'kind' => 'container',
              'cardinality' => 'one',
              'keys' => ['ownerId', 'id']
            }
          }
        }
      },
      attributes => {
        'id' => Optional[String],
        'ownerId' => String,
        'stuff' => String
      }
    },
    OwnerRes => {
      annotations => {
        Lyra::Resource => {
          'providedAttributes' => ['id'],
          'relationships' => {
            'mine' => {
              'type' => ContainedRes,
              'kind' => 'contained',
              'cardinality' => 'many',
              'keys' => ['id', 'ownerId']
            }
          }
        }
      },
      attributes => {
        'id' => Optional[String],
        'phone' => String
      }
    },
    Person => {
      attributes => {
        'name' => {
          'type' => String,
          'value' => ''
        },
        'age' => {
          'type' => Integer,
          'value' => 0
        },
        'human' => {
          'type' => Boolean,
          'value' => false
        },
        'address' => Optional[Address]
      }
    },
    PersonHandler => {
      functions => {
        'create' => Callable[Optional[Person], Tuple[Optional[Person]]],
        'delete' => Callable[String],
        'read' => Callable[String, Optional[Person]],
        'update' => Callable[String, Optional[Person]]
      }
    }
  }
}]
