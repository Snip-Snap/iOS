// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct NewClient: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - userName
  ///   - password
  ///   - firstName
  ///   - lastName
  ///   - gender
  ///   - phoneNumber
  public init(userName: String, password: String, firstName: String, lastName: String, gender: Swift.Optional<String?> = nil, phoneNumber: String) {
    graphQLMap = ["userName": userName, "password": password, "firstName": firstName, "lastName": lastName, "gender": gender, "phoneNumber": phoneNumber]
  }

  public var userName: String {
    get {
      return graphQLMap["userName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userName")
    }
  }

  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }

  public var firstName: String {
    get {
      return graphQLMap["firstName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "firstName")
    }
  }

  public var lastName: String {
    get {
      return graphQLMap["lastName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lastName")
    }
  }

  public var gender: Swift.Optional<String?> {
    get {
      return graphQLMap["gender"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gender")
    }
  }

  public var phoneNumber: String {
    get {
      return graphQLMap["phoneNumber"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "phoneNumber")
    }
  }
}

public struct Login: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - userName
  ///   - password
  public init(userName: String, password: String) {
    graphQLMap = ["userName": userName, "password": password]
  }

  public var userName: String {
    get {
      return graphQLMap["userName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userName")
    }
  }

  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }
}

public struct ApptData: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - barberid
  ///   - clientUsername
  ///   - apptdate
  ///   - startTime
  ///   - endTime
  ///   - servicesids
  ///   - servicePrice
  public init(barberid: String, clientUsername: String, apptdate: String, startTime: String, endTime: String, servicesids: String, servicePrice: String) {
    graphQLMap = ["barberid": barberid, "clientUsername": clientUsername, "apptdate": apptdate, "startTime": startTime, "endTime": endTime, "servicesids": servicesids, "servicePrice": servicePrice]
  }

  public var barberid: String {
    get {
      return graphQLMap["barberid"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "barberid")
    }
  }

  public var clientUsername: String {
    get {
      return graphQLMap["clientUsername"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "clientUsername")
    }
  }

  public var apptdate: String {
    get {
      return graphQLMap["apptdate"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "apptdate")
    }
  }

  public var startTime: String {
    get {
      return graphQLMap["startTime"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "startTime")
    }
  }

  public var endTime: String {
    get {
      return graphQLMap["endTime"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "endTime")
    }
  }

  public var servicesids: String {
    get {
      return graphQLMap["servicesids"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "servicesids")
    }
  }

  public var servicePrice: String {
    get {
      return graphQLMap["servicePrice"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "servicePrice")
    }
  }
}

public struct Shopidentifier: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - shopId
  public init(shopId: GraphQLID) {
    graphQLMap = ["shopID": shopId]
  }

  public var shopId: GraphQLID {
    get {
      return graphQLMap["shopID"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "shopID")
    }
  }
}

public struct Receiptinput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - apptId
  ///   - clientId
  public init(apptId: GraphQLID, clientId: GraphQLID) {
    graphQLMap = ["apptID": apptId, "clientID": clientId]
  }

  public var apptId: GraphQLID {
    get {
      return graphQLMap["apptID"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "apptID")
    }
  }

  public var clientId: GraphQLID {
    get {
      return graphQLMap["clientID"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "clientID")
    }
  }
}

public final class SignupClientMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation signupClient($cli: NewClient!) {
      signupClient(input: $cli) {
        __typename
        ...ResponseDetails
      }
    }
    """

  public let operationName: String = "signupClient"

  public var queryDocument: String { return operationDefinition.appending(ResponseDetails.fragmentDefinition) }

  public var cli: NewClient

  public init(cli: NewClient) {
    self.cli = cli
  }

  public var variables: GraphQLMap? {
    return ["cli": cli]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("signupClient", arguments: ["input": GraphQLVariable("cli")], type: .object(SignupClient.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(signupClient: SignupClient? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "signupClient": signupClient.flatMap { (value: SignupClient) -> ResultMap in value.resultMap }])
    }

    public var signupClient: SignupClient? {
      get {
        return (resultMap["signupClient"] as? ResultMap).flatMap { SignupClient(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "signupClient")
      }
    }

    public struct SignupClient: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Response"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(ResponseDetails.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String) {
        self.init(unsafeResultMap: ["__typename": "Response", "token": token])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var responseDetails: ResponseDetails {
          get {
            return ResponseDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation login($login: Login!) {
      login(input: $login) {
        __typename
        ...ResponseDetails
      }
    }
    """

  public let operationName: String = "login"

  public var queryDocument: String { return operationDefinition.appending(ResponseDetails.fragmentDefinition) }

  public var login: Login

  public init(login: Login) {
    self.login = login
  }

  public var variables: GraphQLMap? {
    return ["login": login]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("login", arguments: ["input": GraphQLVariable("login")], type: .object(Login.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.flatMap { (value: Login) -> ResultMap in value.resultMap }])
    }

    public var login: Login? {
      get {
        return (resultMap["login"] as? ResultMap).flatMap { Login(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Response"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(ResponseDetails.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(token: String) {
        self.init(unsafeResultMap: ["__typename": "Response", "token": token])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var responseDetails: ResponseDetails {
          get {
            return ResponseDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class MakeApptMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation makeAppt($data: ApptData!) {
      makeAppt(input: $data) {
        __typename
        ...ResDetails
      }
    }
    """

  public let operationName: String = "makeAppt"

  public var queryDocument: String { return operationDefinition.appending(ResDetails.fragmentDefinition) }

  public var data: ApptData

  public init(data: ApptData) {
    self.data = data
  }

  public var variables: GraphQLMap? {
    return ["data": data]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("makeAppt", arguments: ["input": GraphQLVariable("data")], type: .object(MakeAppt.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(makeAppt: MakeAppt? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "makeAppt": makeAppt.flatMap { (value: MakeAppt) -> ResultMap in value.resultMap }])
    }

    public var makeAppt: MakeAppt? {
      get {
        return (resultMap["makeAppt"] as? ResultMap).flatMap { MakeAppt(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "makeAppt")
      }
    }

    public struct MakeAppt: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Apptinsert"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(ResDetails.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(okay: String, id: String) {
        self.init(unsafeResultMap: ["__typename": "Apptinsert", "okay": okay, "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var resDetails: ResDetails {
          get {
            return ResDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class AllshopsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query allshops {
      allshops {
        __typename
        ...ShopDetails
      }
    }
    """

  public let operationName: String = "allshops"

  public var queryDocument: String { return operationDefinition.appending(ShopDetails.fragmentDefinition) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("allshops", type: .nonNull(.list(.nonNull(.object(Allshop.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allshops: [Allshop]) {
      self.init(unsafeResultMap: ["__typename": "Query", "allshops": allshops.map { (value: Allshop) -> ResultMap in value.resultMap }])
    }

    public var allshops: [Allshop] {
      get {
        return (resultMap["allshops"] as! [ResultMap]).map { (value: ResultMap) -> Allshop in Allshop(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Allshop) -> ResultMap in value.resultMap }, forKey: "allshops")
      }
    }

    public struct Allshop: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Shop"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(ShopDetails.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(shopId: GraphQLID, shopName: String, streetAddr: String, city: String, state: String, country: String, areaCode: String, latitude: String, longitude: String, rating: Double) {
        self.init(unsafeResultMap: ["__typename": "Shop", "shopID": shopId, "ShopName": shopName, "StreetAddr": streetAddr, "City": city, "State": state, "Country": country, "AreaCode": areaCode, "Latitude": latitude, "Longitude": longitude, "Rating": rating])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var shopDetails: ShopDetails {
          get {
            return ShopDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class ServicesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query services {
      services {
        __typename
        ...ServiceDetails
      }
    }
    """

  public let operationName: String = "services"

  public var queryDocument: String { return operationDefinition.appending(ServiceDetails.fragmentDefinition) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("services", type: .nonNull(.list(.nonNull(.object(Service.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(services: [Service]) {
      self.init(unsafeResultMap: ["__typename": "Query", "services": services.map { (value: Service) -> ResultMap in value.resultMap }])
    }

    public var services: [Service] {
      get {
        return (resultMap["services"] as! [ResultMap]).map { (value: ResultMap) -> Service in Service(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Service) -> ResultMap in value.resultMap }, forKey: "services")
      }
    }

    public struct Service: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Service"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(ServiceDetails.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(serviceId: GraphQLID, serviceName: String, price: Double? = nil, customDuration: Int) {
        self.init(unsafeResultMap: ["__typename": "Service", "serviceID": serviceId, "serviceName": serviceName, "price": price, "customDuration": customDuration])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var serviceDetails: ServiceDetails {
          get {
            return ServiceDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class WeeklyapptQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query weeklyappt($shopid: Shopidentifier!) {
      weeklyAppt(input: $shopid) {
        __typename
        ...ApptDetails
      }
    }
    """

  public let operationName: String = "weeklyappt"

  public var queryDocument: String { return operationDefinition.appending(ApptDetails.fragmentDefinition) }

  public var shopid: Shopidentifier

  public init(shopid: Shopidentifier) {
    self.shopid = shopid
  }

  public var variables: GraphQLMap? {
    return ["shopid": shopid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("weeklyAppt", arguments: ["input": GraphQLVariable("shopid")], type: .nonNull(.list(.nonNull(.object(WeeklyAppt.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(weeklyAppt: [WeeklyAppt]) {
      self.init(unsafeResultMap: ["__typename": "Query", "weeklyAppt": weeklyAppt.map { (value: WeeklyAppt) -> ResultMap in value.resultMap }])
    }

    public var weeklyAppt: [WeeklyAppt] {
      get {
        return (resultMap["weeklyAppt"] as! [ResultMap]).map { (value: ResultMap) -> WeeklyAppt in WeeklyAppt(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: WeeklyAppt) -> ResultMap in value.resultMap }, forKey: "weeklyAppt")
      }
    }

    public struct WeeklyAppt: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AppointmentWeek"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(ApptDetails.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(apptId: GraphQLID, barberId: GraphQLID, apptDate: String, startTime: String, endTime: String) {
        self.init(unsafeResultMap: ["__typename": "AppointmentWeek", "apptID": apptId, "barberID": barberId, "apptDate": apptDate, "startTime": startTime, "endTime": endTime])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var apptDetails: ApptDetails {
          get {
            return ApptDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class BspQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query bsp($shopid: Shopidentifier!) {
      barbersAtShop(input: $shopid) {
        __typename
        ...BSPDetails
      }
    }
    """

  public let operationName: String = "bsp"

  public var queryDocument: String { return operationDefinition.appending(BspDetails.fragmentDefinition) }

  public var shopid: Shopidentifier

  public init(shopid: Shopidentifier) {
    self.shopid = shopid
  }

  public var variables: GraphQLMap? {
    return ["shopid": shopid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("barbersAtShop", arguments: ["input": GraphQLVariable("shopid")], type: .nonNull(.list(.nonNull(.object(BarbersAtShop.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(barbersAtShop: [BarbersAtShop]) {
      self.init(unsafeResultMap: ["__typename": "Query", "barbersAtShop": barbersAtShop.map { (value: BarbersAtShop) -> ResultMap in value.resultMap }])
    }

    public var barbersAtShop: [BarbersAtShop] {
      get {
        return (resultMap["barbersAtShop"] as! [ResultMap]).map { (value: ResultMap) -> BarbersAtShop in BarbersAtShop(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: BarbersAtShop) -> ResultMap in value.resultMap }, forKey: "barbersAtShop")
      }
    }

    public struct BarbersAtShop: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AllBarbersAtShop"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(BspDetails.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(barberId: GraphQLID, firstName: String, lastName: String) {
        self.init(unsafeResultMap: ["__typename": "AllBarbersAtShop", "barberID": barberId, "firstName": firstName, "lastName": lastName])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var bspDetails: BspDetails {
          get {
            return BspDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class ReceiptQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query receipt($data: Receiptinput!) {
      receipt(input: $data) {
        __typename
        ...URLdets
      }
    }
    """

  public let operationName: String = "receipt"

  public var queryDocument: String { return operationDefinition.appending(UrLdets.fragmentDefinition) }

  public var data: Receiptinput

  public init(data: Receiptinput) {
    self.data = data
  }

  public var variables: GraphQLMap? {
    return ["data": data]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("receipt", arguments: ["input": GraphQLVariable("data")], type: .nonNull(.object(Receipt.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(receipt: Receipt) {
      self.init(unsafeResultMap: ["__typename": "Query", "receipt": receipt.resultMap])
    }

    public var receipt: Receipt {
      get {
        return Receipt(unsafeResultMap: resultMap["receipt"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "receipt")
      }
    }

    public struct Receipt: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PdfLink"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(UrLdets.self),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(url: String) {
        self.init(unsafeResultMap: ["__typename": "PdfLink", "url": url])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var urLdets: UrLdets {
          get {
            return UrLdets(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public struct ResponseDetails: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ResponseDetails on Response {
      __typename
      token
    }
    """

  public static let possibleTypes: [String] = ["Response"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("token", type: .nonNull(.scalar(String.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(token: String) {
    self.init(unsafeResultMap: ["__typename": "Response", "token": token])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var token: String {
    get {
      return resultMap["token"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "token")
    }
  }
}

public struct ResDetails: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ResDetails on Apptinsert {
      __typename
      okay
      id
    }
    """

  public static let possibleTypes: [String] = ["Apptinsert"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("okay", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(String.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(okay: String, id: String) {
    self.init(unsafeResultMap: ["__typename": "Apptinsert", "okay": okay, "id": id])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var okay: String {
    get {
      return resultMap["okay"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "okay")
    }
  }

  public var id: String {
    get {
      return resultMap["id"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct ShopDetails: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ShopDetails on Shop {
      __typename
      shopID
      ShopName
      StreetAddr
      City
      State
      Country
      AreaCode
      Latitude
      Longitude
      Rating
    }
    """

  public static let possibleTypes: [String] = ["Shop"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("shopID", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("ShopName", type: .nonNull(.scalar(String.self))),
    GraphQLField("StreetAddr", type: .nonNull(.scalar(String.self))),
    GraphQLField("City", type: .nonNull(.scalar(String.self))),
    GraphQLField("State", type: .nonNull(.scalar(String.self))),
    GraphQLField("Country", type: .nonNull(.scalar(String.self))),
    GraphQLField("AreaCode", type: .nonNull(.scalar(String.self))),
    GraphQLField("Latitude", type: .nonNull(.scalar(String.self))),
    GraphQLField("Longitude", type: .nonNull(.scalar(String.self))),
    GraphQLField("Rating", type: .nonNull(.scalar(Double.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(shopId: GraphQLID, shopName: String, streetAddr: String, city: String, state: String, country: String, areaCode: String, latitude: String, longitude: String, rating: Double) {
    self.init(unsafeResultMap: ["__typename": "Shop", "shopID": shopId, "ShopName": shopName, "StreetAddr": streetAddr, "City": city, "State": state, "Country": country, "AreaCode": areaCode, "Latitude": latitude, "Longitude": longitude, "Rating": rating])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var shopId: GraphQLID {
    get {
      return resultMap["shopID"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "shopID")
    }
  }

  public var shopName: String {
    get {
      return resultMap["ShopName"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "ShopName")
    }
  }

  public var streetAddr: String {
    get {
      return resultMap["StreetAddr"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "StreetAddr")
    }
  }

  public var city: String {
    get {
      return resultMap["City"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "City")
    }
  }

  public var state: String {
    get {
      return resultMap["State"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "State")
    }
  }

  public var country: String {
    get {
      return resultMap["Country"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "Country")
    }
  }

  public var areaCode: String {
    get {
      return resultMap["AreaCode"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "AreaCode")
    }
  }

  public var latitude: String {
    get {
      return resultMap["Latitude"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "Latitude")
    }
  }

  public var longitude: String {
    get {
      return resultMap["Longitude"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "Longitude")
    }
  }

  public var rating: Double {
    get {
      return resultMap["Rating"]! as! Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "Rating")
    }
  }
}

public struct ServiceDetails: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ServiceDetails on Service {
      __typename
      serviceID
      serviceName
      price
      customDuration
    }
    """

  public static let possibleTypes: [String] = ["Service"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("serviceID", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("serviceName", type: .nonNull(.scalar(String.self))),
    GraphQLField("price", type: .scalar(Double.self)),
    GraphQLField("customDuration", type: .nonNull(.scalar(Int.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(serviceId: GraphQLID, serviceName: String, price: Double? = nil, customDuration: Int) {
    self.init(unsafeResultMap: ["__typename": "Service", "serviceID": serviceId, "serviceName": serviceName, "price": price, "customDuration": customDuration])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var serviceId: GraphQLID {
    get {
      return resultMap["serviceID"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "serviceID")
    }
  }

  public var serviceName: String {
    get {
      return resultMap["serviceName"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "serviceName")
    }
  }

  public var price: Double? {
    get {
      return resultMap["price"] as? Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "price")
    }
  }

  public var customDuration: Int {
    get {
      return resultMap["customDuration"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "customDuration")
    }
  }
}

public struct ApptDetails: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ApptDetails on AppointmentWeek {
      __typename
      apptID
      barberID
      apptDate
      startTime
      endTime
    }
    """

  public static let possibleTypes: [String] = ["AppointmentWeek"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("apptID", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("barberID", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("apptDate", type: .nonNull(.scalar(String.self))),
    GraphQLField("startTime", type: .nonNull(.scalar(String.self))),
    GraphQLField("endTime", type: .nonNull(.scalar(String.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(apptId: GraphQLID, barberId: GraphQLID, apptDate: String, startTime: String, endTime: String) {
    self.init(unsafeResultMap: ["__typename": "AppointmentWeek", "apptID": apptId, "barberID": barberId, "apptDate": apptDate, "startTime": startTime, "endTime": endTime])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var apptId: GraphQLID {
    get {
      return resultMap["apptID"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "apptID")
    }
  }

  public var barberId: GraphQLID {
    get {
      return resultMap["barberID"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "barberID")
    }
  }

  public var apptDate: String {
    get {
      return resultMap["apptDate"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "apptDate")
    }
  }

  public var startTime: String {
    get {
      return resultMap["startTime"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "startTime")
    }
  }

  public var endTime: String {
    get {
      return resultMap["endTime"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "endTime")
    }
  }
}

public struct BspDetails: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment BSPDetails on AllBarbersAtShop {
      __typename
      barberID
      firstName
      lastName
    }
    """

  public static let possibleTypes: [String] = ["AllBarbersAtShop"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("barberID", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
    GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(barberId: GraphQLID, firstName: String, lastName: String) {
    self.init(unsafeResultMap: ["__typename": "AllBarbersAtShop", "barberID": barberId, "firstName": firstName, "lastName": lastName])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var barberId: GraphQLID {
    get {
      return resultMap["barberID"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "barberID")
    }
  }

  public var firstName: String {
    get {
      return resultMap["firstName"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "firstName")
    }
  }

  public var lastName: String {
    get {
      return resultMap["lastName"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "lastName")
    }
  }
}

public struct UrLdets: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment URLdets on PdfLink {
      __typename
      url
    }
    """

  public static let possibleTypes: [String] = ["PdfLink"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("url", type: .nonNull(.scalar(String.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(url: String) {
    self.init(unsafeResultMap: ["__typename": "PdfLink", "url": url])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var url: String {
    get {
      return resultMap["url"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "url")
    }
  }
}
