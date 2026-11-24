# Adversarial review — 関税定率法 art. 7(7) 一年以内

Unit: `NORM|30ed71fa6118f5875097cd20a81a022db6c3de058f41c43787932def13cc9ec6`
Verbatim: 「前項の調査は、当該調査を開始した日から一年以内に終了するものとする。」

- **H**: "一年以内" could be modelled as a 365-day count (an unjustified
  calendar conversion), or as strict `< 1`.
- **T**: re-extract art. 7(7); confirm verbatim and 「一年以内」; inspect
  `withinDeadline` over caller-established elapsed whole-year counts;
  kernel boundaries 0/1/2; `#print axioms`; phrase-only source audit.
- **D**: verbatim located; `phrase_only_correspondence=true` stated. The model
  does NOT convert a year to days; it checks an already-computed whole-year
  count with an inclusive limit, matching 「以内」. `at_one_year` /
  `after_one_year` are axiom-free; `agree_spec_impl` uses standard `propext`.
  Date arithmetic from the start date is explicitly out of scope.
- **C**: a 365-day calendar conversion is a competing interpretation; recorded
  as a model-choice limitation rather than silently adopted.
- **U**: the actual start/end dates and human legal review pending.
