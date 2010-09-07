package MusicBrainz::Server::Plugin::Wizard;
use Moose;

# use strict;
# use warnings;

use base 'Template::Plugin';

sub new
{
    my ($class, $context) = @_;

    return bless { context => $context }, $class;
}

sub _wizard
{
    my ($self) = @_;

    return $self->{context}->{STASH}->{wizard};
}

sub get_field
{
    my ($self, $step, $field) = @_;

    my $page = $self->_wizard->page_number->{$step};
    $page = $step unless defined $page;

    my $form = $self->_wizard->load_page ($page);

    return $form->field($field);
}

1;

=head1 COPYRIGHT

Copyright (C) 2010  MetaBrainz Foundation

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

=cut
