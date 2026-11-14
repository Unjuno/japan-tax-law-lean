# Contributing / 貢献ガイド

Thanks for contributing to the formal verification of Japanese tax law.

## Requirements for a proposed statute formalization

1. Identify the **law ID, exact article/paragraph/item and effective date**.
2. Link the corresponding **official e-Gov** text and, when pertinent, National Tax Agency explanatory materials. Preserve enough information to identify the effective-law snapshot.
3. Document every assumption, unresolved legal term and exception. Do not silently equate a statutory **year** with 365 days.
4. Add a Lean definition and positive/negative tests. Include at least one boundary scenario relevant to the provision.
5. Keep `lake build` passing, with no `sorry`, `admit` or invented axioms for critical legal claims.
6. Distinguish legal-text ambiguity, formal counterexamples, implementation errors, and issues created by incomplete modeling.
7. Request independent legal/domain review before labeling a result a tax-law error or loophole.

## Pull request checklist

- [ ] Source law, provision and effective date identified
- [ ] Formalization scope and assumptions documented
- [ ] Exceptions and cross-references considered
- [ ] Proofs/tests added and `lake build` passes
- [ ] No claim stronger than the evidence supports

Please be careful not to publish personal taxpayer information. This project does **not** provide personalized legal or tax advice.
