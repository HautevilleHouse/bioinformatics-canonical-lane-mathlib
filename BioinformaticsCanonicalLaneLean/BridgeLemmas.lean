import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.alignmentConclusion

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.alignmentConclusionTerm

end BioinformaticsCanonicalLaneLean
end HautevilleHouse
