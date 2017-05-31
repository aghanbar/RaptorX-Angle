#!/usr/bin/perl -w

#get perl executive path
$perlPath=`which perl`;
chomp($perlPath);
die "No perl found in searching folders.\n" if ($perlPath=~/no perl/);
#die "./setup.pl [ -cpu [CPU number = 1 (default)] ] " if @ARGV<1;
#%params=@ARGV;
$cnfhome=`pwd`;chomp($cnfhome);
$curhome=`./self_pwd.sh 1`;chomp($curhome);
$pelhome=`./self_pwd.sh 0`;chomp($pelhome);
$relhome="\$ENV{\"HOME\"}.";


# ======== now we run into util/ directory =========
# genMAIN.sh -> for PSP, MTX, and HMM files
open fhRUN,"<".$cnfhome."/util/genMAIN.sh";
open fhRUNNEW,">".$cnfhome."/util/genMAIN.sh.new";
while(<fhRUN>){
    if(/^RaptorX_HOME=/){
        print fhRUNNEW "RaptorX_HOME=".$curhome."\n";
        next;
    }
    print fhRUNNEW "$_";
}
close fhRUN;
close fhRUNNEW;
$cmd="mv ".$cnfhome."/util/genMAIN.sh.new ".$cnfhome."/util/genMAIN.sh";
`$cmd`;
chmod(0755, $cnfhome."/util/genMAIN.sh");


# genSS3.sh -> PSIPRED
open fhRUN,"<".$cnfhome."/util/genSS3.sh";
open fhRUNNEW,">".$cnfhome."/util/genSS3.sh.new";
while(<fhRUN>){
    if(/^RaptorX_HOME=/){
	print fhRUNNEW "RaptorX_HOME=".$curhome."\n";
        next;
    }
    print fhRUNNEW "$_";
}
close fhRUN;
close fhRUNNEW;
$cmd="mv ".$cnfhome."/util/genSS3.sh.new ".$cnfhome."/util/genSS3.sh";
`$cmd`;
chmod(0755, $cnfhome."/util/genSS3.sh");


# genDIS.sh -> DISOPRED
open fhRUN,"<".$cnfhome."/util/genDIS.sh";
open fhRUNNEW,">".$cnfhome."/util/genDIS.sh.new";
while(<fhRUN>){
        if(/^RaptorX_HOME=/){
                print fhRUNNEW "RaptorX_HOME=".$curhome."\n";
                next;
        }
        print fhRUNNEW "$_";
}
close fhRUN;
close fhRUNNEW;
$cmd="mv ".$cnfhome."/util/genDIS.sh.new ".$cnfhome."/util/genDIS.sh";
`$cmd`;
chmod(0755, $cnfhome."/util/genDIS.sh");


# genSS8.sh
open fhRUN,"<".$cnfhome."/util/genSS8.sh";
open fhRUNNEW,">".$cnfhome."/util/genSS8.sh.new";
while(<fhRUN>){
    if(/^RaptorX_HOME=/){
        print fhRUNNEW "RaptorX_HOME=".$curhome."\n";
	next;
    }
    print fhRUNNEW "$_";
}
close fhRUN;
close fhRUNNEW;
$cmd="mv ".$cnfhome."/util/genSS8.sh.new ".$cnfhome."/util/genSS8.sh";
`$cmd`;
chmod(0755, $cnfhome."/util/genSS8.sh");


# genACC.sh
open fhRUN,"<".$cnfhome."/util/genACC.sh";
open fhRUNNEW,">".$cnfhome."/util/genACC.sh.new";
while(<fhRUN>){
    if(/^RaptorX_HOME=/){
        print fhRUNNEW "RaptorX_HOME=".$curhome."\n";
        next;
    }
    print fhRUNNEW "$_";
}
close fhRUN;
close fhRUNNEW;
$cmd="mv ".$cnfhome."/util/genACC.sh.new ".$cnfhome."/util/genACC.sh";
`$cmd`;
chmod(0755, $cnfhome."/util/genACC.sh");


# ======== now we run into directory =========
#SS8_Predict -> run_raptorx-ss8.pl
open fhRUN,"<".$cnfhome."/util/SS8_Predict/bin/run_raptorx-ss8.pl";
open fhRUNNEW,">".$cnfhome."/util/SS8_Predict/bin/run_raptorx-ss8.pl.new";
while(<fhRUN>){
    if(/^\$raptorx=/){
        print fhRUNNEW "\$raptorx=$relhome\"".$pelhome."\";\n";
        next;
    }
    print fhRUNNEW "$_";
}
close fhRUN;
close fhRUNNEW;
$cmd="mv ".$cnfhome."/util/SS8_Predict/bin/run_raptorx-ss8.pl.new ".$cnfhome."/util/SS8_Predict/bin/run_raptorx-ss8.pl";
`$cmd`;
chmod(0755, $cnfhome."/util/SS8_Predict/bin/run_raptorx-ss8.pl");

