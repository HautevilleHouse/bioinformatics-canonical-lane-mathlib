import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

structure GeneExpressionPackage where
  expressionMatrix : Type
  normalizationMethod : Type
  differentialExpressionTest : Prop
  foldChangeComputed : Prop
  pValueAdjusted : Prop
  multipleTestingCorrection : Prop

structure GeneExpressionEvidence (G : GeneExpressionPackage) where
  differentialExpressionTestClosed : G.differentialExpressionTest
  foldChangeComputedClosed : G.foldChangeComputed
  pValueAdjustedClosed : G.pValueAdjusted
  multipleTestingCorrectionClosed : G.multipleTestingCorrection

def GeneExpressionClosed (G : GeneExpressionPackage) : Prop :=
  G.differentialExpressionTest ∧ G.foldChangeComputed ∧ G.pValueAdjusted ∧ G.multipleTestingCorrection

theorem gene_expression_closed_from_evidence (G : GeneExpressionPackage) (E : GeneExpressionEvidence G) :
    GeneExpressionClosed G :=
  And.intro E.differentialExpressionTestClosed
    (And.intro E.foldChangeComputedClosed (And.intro E.pValueAdjustedClosed E.multipleTestingCorrectionClosed))

end BioinformaticsCanonicalLaneLean
end HautevilleHouse
