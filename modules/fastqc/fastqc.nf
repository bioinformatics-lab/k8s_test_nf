// based on https://github.com/nf-modules/fastqc
nextflow.enable.dsl = 2

process FASTQC {

    input:
    tuple val(genomeName), file(genomeReads)

    output:
    tuple file(genomeReads),file('*.html'), file('*.zip')
    script:

    """
    fastqc *
    """
}
