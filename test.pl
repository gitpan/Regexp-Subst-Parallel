use Test::Simple tests => 11;

use Regexp::Subst::Parallel;

#1
ok(subst('a', 'a' => 'b') eq 'b', "Basic");
#2
ok(subst('arnold', qr/(arnold)/ => '$1 rimmer') eq 'arnold rimmer', "Capture");
#3
ok(subst('arnrim', qr/(arn)(rim)/ => '${1}old ${2}mer') eq 'arnold rimmer', 
   "More sohistocated capture");
#4
ok(subst('arnold', 'arn' => 'rim',
         'old' => 'mer') eq 'rimmer', "Simple multiple");
#5
ok(subst('merrim', 'mer' => 'rim',
         'rim' => 'mer') eq 'rimmer', "Simple parallel");
#6
ok(subst('<arnold> _rimmer_', qr/_(\w+)_/ => '<b>$1</b>',
         qr/<(\w+)>/ => '<i>$1</i>') eq '<i>arnold</i> <b>rimmer</b>', 
   "Parallel capture");
#7
ok(subst('foo', qr/(foo)/ => '\\$1') eq '$1', "Backslashes 101");
#8
ok(subst('foo', qr/(foo)/ => '\\\\$1') eq '\\foo', "Backslashes 102");
#9
ok(subst('foo', qr/(foo)/ => '\\\\\\$1') eq '\\$1', "Backslashes 103");
#10
ok(subst('foo', qr/(fo)/  => '\\${1}0') eq '${1}0o', "Backslashes 104");
#11
ok(subst('foo', qr/(fo)/  => '\\\\${1}0') eq '\\fo0o', "Backslashes 105");
