# Adversarial review — 地方税法 art. 72の24の2(2)二 (委任 7%)

Unit: `NORM|4ce573224735cd582616b3a9fc89d747f78adfc99af4f10479fa672e1b948b19`
Verbatim: 「貯蓄保険（個人保険のうち貯蓄を主目的とする保険で政令で定めるものを
いう。）にあつては、各事業年度の収入保険料に百分の七を乗じて得た金額」

- **H**: the cabinet-order definition (政令で定める) could be silently treated
  as resolved, or the 7% rate applied to all insurance categories; or 7/100
  encoded as 7/1000.
- **T**: re-extract the article; parse 百分の七 → [7, 100] (auditor D=PASS);
  inspect `categoryAmount` (designation Bool gates the rate); check
  `#print axioms`; boundaries designated true/false and premiums 0/1/100/1000.
- **D**: verbatim located; constants [7, 100] present in spec and impl. The
  delegated determination is NOT resolved by this unit — it is a
  caller-established `Bool`, and the model explicitly yields zero when the
  designation is false. `rate_components` and `applies_when_designated` are
  axiom-free; `agree_spec_impl` uses standard `propext`. The cabinet order's
  content, the premium and other categories are out of scope.
- **C**: treating the delegated definition as decidable from the statute alone
  is a competing reading; rejected and recorded.
- **U**: the actual cabinet-order designation and human legal review pending.
