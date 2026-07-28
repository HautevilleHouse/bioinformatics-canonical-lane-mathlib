import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BioinformaticsCanonicalLaneLean.BioinformaticsObjects

namespace HautevilleHouse
namespace BioinformaticsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BioinformaticsProofObligation where
  sourceKey : String
  theoremObject : String
  commonCoreImported : Bool
  theoremSpecificDefinitionsNative : Bool
  theoremSpecificBridgeNative : Bool
  theoremSpecificAdmittedClosureNative : Bool
  unrestrictedClassicalClosureNative : Bool
  carriedGap : String

def sourceRepository : String := "bioinformatics-canonical-lane"
def sourceDescription : String := "Bioinformatics closure theorem"

def bioinformaticsProofObligation : BioinformaticsProofObligation := {
  sourceKey := sourceRepository,
  theoremObject := sourceDescription,
  commonCoreImported := true,
  theoremSpecificDefinitionsNative := true,
  theoremSpecificBridgeNative := true,
  theoremSpecificAdmittedClosureNative := true,
  unrestrictedClassicalClosureNative := false,
  carriedGap := "theorem-specific endgame pilot closes over the admitted class; unrestricted classical closure remains carried"
}

def commonCoreProjectionLawAvailable : Prop :=
  forall {X : Type} [Add X] [Sub X] (L : AdditiveLane X),
    L.xNext = L.state + L.projection.toFun L.delta

def commonCoreCarriageLawAvailable : Prop :=
  forall {X : Type} [Add X] [Sub X] (L : AdditiveLane X),
    L.carriedComponent = L.delta - L.projection.toFun L.delta

def commonCoreIdempotenceAvailable : Prop :=
  forall {X : Type} [Add X] [Sub X] (L : AdditiveLane X),
    L.projection.toFun (L.projection.toFun L.delta) = L.projection.toFun L.delta

theorem bioinformatics_common_core_projection_law_checked :
    commonCoreProjectionLawAvailable := by
  intro X instAdd instSub L
  exact AdditiveLane.x_next_eq L

theorem bioinformatics_common_core_carriage_law_checked :
    commonCoreCarriageLawAvailable := by
  intro X instAdd instSub L
  exact AdditiveLane.carried_component_eq L

theorem bioinformatics_common_core_idempotence_checked :
    commonCoreIdempotenceAvailable := by
  intro X instAdd instSub L
  exact AdditiveLane.projection_idempotent_on_delta L

def theoremSpecificEndgamePilotClosed : Prop :=
  forall A : AdmissibleClass, ConstrainedBioinformaticsClosure A

-- Note: ConstrainedBioinformaticsClosure is defined in FinalTheorem.lean

end BioinformaticsCanonicalLaneLean
end HautevilleHouse