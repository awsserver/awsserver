#!/bin/bash

main()
{
   echo 'MAIN sees ' $# ' args'
}

main $*
main $@

main "$*"
main "$@"

### end ###


