nextflow.enable.dsl = 2

// Modules inclusion
include {FASTQC} from "./modules/fastqc/fastqc.nf"
include {MULTIQC} from "./modules/multiqc/multiqc.nf"

workflow {
    if( params.runType == "sra" ) {
        input_ch = Channel.fromSRA(params.genomeIds, cache: true, apiKey: params.apiKey)}

    if(params.runType == "local"){
        input_ch = Channel.fromFilePairs(params.reads)}

    FASTQC(input_ch)
    MULTIQC(FASTQC.out.flatten().collect())

}
