//based on https://github.com/nf-modules/multiqc
nextflow.enable.dsl = 2

process MULTIQC {
    publishDir params.resultsDir, mode: params.saveMode
    container 'quay.io/biocontainers/multiqc:1.9--pyh9f0ad1d_0'

    input:
    file("*")

    output:
    tuple path("""multiqc_data"""),
            path("""multiqc_report.html""")


    script:

    """
    multiqc .
    """

}
