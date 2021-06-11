nextflow.enable.dsl = 2

// Modules inclusion
include {FASTQC} from "./modules/fastqc/fastqc.nf"
include {MULTIQC} from "./modules/multiqc/multiqc.nf"

//base workflow
workflow {
    if (params.reads) {
        input_ch = Channel.fromFilePairs(params.reads)
    } else {
        input_ch = Channel.fromSRA(params.genomeIds, cache: true, apiKey: params.apiKey)
    }

    FASTQC(input_ch)
    MULTIQC(FASTQC.out.flatten().collect())

}
