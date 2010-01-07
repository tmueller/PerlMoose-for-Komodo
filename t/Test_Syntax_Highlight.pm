package TEST::Moose;
use Moose;

extends 'TEST';
with    'TEST::Role';

has attribute => (
    is      => 'rw',
    isa     => 'PACKAGE',
);

################################################################################
sub new {
    my $class = shift;
    my $self = bless {}, $class;
    return $self;
}

################################################################################
sub test_sub {}
before      test_sub => sub { blessed{}         };
around      test_sub => sub { inner->()         };
after       test_sub => sub { confess('test')   };
override    test_sub => sub { super->()         };
augment     test_sub => sub {};                     #don't know what augment is

#STARTREGION

#ENDREGION


1;
