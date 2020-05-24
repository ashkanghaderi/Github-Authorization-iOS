//
//  NetworkProvider.swift
//  NetworkPlatform
//
//  Created by Behrad Kazemi on 12/26/18.
//  Copyright © 2018 Behrad Kazemi. All rights reserved.
//
import Domain

final class NetworkProvider {
	private var apiEndpoint: String {
		var endpoint = Constants.EndPoints.defaultBaseUrl.rawValue
//        if let baseURL = UserDefaults.standard.string(forKey: Constants.Keys.Settings.baseURL.rawValue), !baseURL.isEmpty {
//            endpoint = baseURL
//        }
		return endpoint
	}
//    [TODO] [MOCKFLAG]
    private let mockBaseURL = "http://www.mocky.io/v2/"
	//MARK: - Login and Authorization
	public func makeAuthorizationNetwork() -> AuthenticationNetwork {
		let network = Network<TokenModel.Response>(apiEndpoint)
        //let network = Network<TokenModel.Response>(mockBaseURL)
		return AuthenticationNetwork(network: network)
	}
	
	public func makeSetPhoneNetwork() -> SetPhoneNetwork {
		let network = Network<SetPhoneNetworkModel.Response>(apiEndpoint)
        //let network = Network<SetPhoneNetworkModel.Response>(mockBaseURL)
		return SetPhoneNetwork(network: network)
	}
	
	public func makeVerifyPhoneNetwork() -> VerifyPhoneNetwork {
		let verifyNetwork = Network<VerifyPhoneNetworkModel.Response>(apiEndpoint)
		let resendNetwork = Network<SetPhoneNetworkModel.Response>(apiEndpoint)
        //let verifyNetwork = Network<VerifyPhoneNetworkModel.Response>(mockBaseURL)
        //let resendNetwork = Network<SetPhoneNetworkModel.Response>(mockBaseURL)
		return VerifyPhoneNetwork(verifyNetwork: verifyNetwork, resendNetwork: resendNetwork)
	}
	
	public func makeRegisterNetwork() -> RegisterNetwork {
		let network = Network<RegisterNetworkModel.Response>(apiEndpoint)
		return RegisterNetwork(setUserNetwork: network)
        
        //let network = Network<RegisterNetworkModel.Response>(mockBaseURL)
        //return RegisterNetwork(setUserNetwork: network)
	}
	
	public func makeMenuNetwork() -> MenuNetwork{
		//let getOffersNetwork = Network<MenuNetworkModel.GetOffers.Response>(apiEndpoint)
		//return MenuNetwork(getOffersNetwork: getOffersNetwork)
        
        let getOffersNetwork = Network<MenuNetworkModel.GetOffers.Response>(mockBaseURL)
        return MenuNetwork(getOffersNetwork: getOffersNetwork)
	}
	
	public func makeGetProfileNetwork() -> ProfileNetwork{
		//let getProfile = Network<ProfileNetworkModel.GetProfile.Response>(apiEndpoint)
		//return ProfileNetwork(profileIONetwork: getProfile)
        
        let getProfile = Network<ProfileNetworkModel.GetProfile.Response>(mockBaseURL)
        return ProfileNetwork(profileIONetwork: getProfile)
	}
    
    public func makeGetStateCityNetwork() -> StateCityNetwork{
        //let getProfile = Network<ProfileNetworkModel.GetProfile.Response>(apiEndpoint)
        //return ProfileNetwork(profileIONetwork: getProfile)
        
        let getState = Network<StateCityNetworkModel.GetStateCity.Response>(apiEndpoint)
        return StateCityNetwork(stateCityNetwork: getState)
        //let getState = Network<StateCityNetworkModel.GetStateCity.Response>(mockBaseURL)
        //return StateCityNetwork(stateCityNetwork: getState)
    }
	
	public func makeTVShowQuizBatchNetwork() -> TVShowGetQuizBatchNetwork {
		return TVShowGetQuizBatchNetwork(network: Network<QuizBatchNetworkModel.Response>(apiEndpoint))
        //return TVShowGetQuizBatchNetwork(network: Network<QuizBatchNetworkModel.Response>(mockBaseURL))
	}
	
	public func makeQuestionSceneNetwork() -> QuestionSceneNetwork {
		return QuestionSceneNetwork(answerNetwork: Network<AnswerNetworkModel.Response>(apiEndpoint))
        //return QuestionSceneNetwork(answerNetwork: Network<AnswerNetworkModel.Response>(mockBaseURL))
	}
	
	public func makeCreditNetwork() -> CreditNetwork{
		let addNetwork = Network<CreditNetworkModel.AddCredit.Response>(apiEndpoint)
		let getNetwork = Network<CreditNetworkModel.GetCredit.Response>(apiEndpoint)
        let withdrawNetwork = Network<CreditNetworkModel.Withdraw.Response>(apiEndpoint)
        //let addNetwork = Network<CreditNetworkModel.AddCredit.Response>(mockBaseURL)
        //let getNetwork = Network<CreditNetworkModel.GetCredit.Response>(mockBaseURL)
        //let withdrawNetwork = Network<CreditNetworkModel.Withdraw.Response>(mockBaseURL)
        return CreditNetwork(addCreditNetwork: addNetwork, getCreditNetwork: getNetwork, withdrawNetwork: withdrawNetwork)
	}
	
	public func makeRankingNetwork() -> RankingNetwork{
		return RankingNetwork(network: Network<RankingNetworkModel.Response>(apiEndpoint))
        //return RankingNetwork(network: Network<RankingNetworkModel.Response>(mockBaseURL))
	}
	
    public func makeTicketsNetwork() -> TicketsNetwork{
        let getTicketsNetwork = Network<TicketsNetworkModel.getTickets.Response>(apiEndpoint)
        let sendTicketNetwork = Network<TicketsNetworkModel.sendTicket.Response>(apiEndpoint)
        //let getTicketsNetwork = Network<TicketsNetworkModel.getTickets.Response>(mockBaseURL)
        //let sendTicketNetwork = Network<TicketsNetworkModel.sendTicket.Response>(mockBaseURL)
        return TicketsNetwork(getTicketsNetwork: getTicketsNetwork, sendTicketNetwork: sendTicketNetwork)
    }
    
    public func makeMessagesNetwork() -> MessagesNetwork{
        let getMessagesNetwork = Network<MessagesNetworkModel.getMessages.Response>(apiEndpoint)
        let sendMessagesNetwork = Network<MessagesNetworkModel.sendMessage.Response>(apiEndpoint)
        //let getMessagesNetwork = Network<MessagesNetworkModel.getMessages.Response>(mockBaseURL)
        //let sendMessagesNetwork = Network<MessagesNetworkModel.sendMessage.Response>(mockBaseURL)
        return MessagesNetwork(getMessagesNetwork: getMessagesNetwork, sendMessageNetwork: sendMessagesNetwork)
    }


	public func makeSupportNetwork() -> SupportNetwork{
		return SupportNetwork(network: Network<FAQTopicNetworkModel.getFAQ.Response>(apiEndpoint))
        //return SupportNetwork(network: Network<FAQTopicNetworkModel.getFAQ.Response>(mockBaseURL))
	}
	
	public func makeAboutusNetwork() -> AboutusNetwork{
		return AboutusNetwork(network: Network<AboutusNetworkModel.Response>(apiEndpoint))
        //return AboutusNetwork(network: Network<AboutusNetworkModel.Response>(mockBaseURL))
	}
	
	public func makeLogoutNetwork() -> LogoutNetwork{
		return LogoutNetwork(network: Network<LogoutNetworkModel.Response>(apiEndpoint))
        //return LogoutNetwork(network: Network<LogoutNetworkModel.Response>(mockBaseURL))
	}
	
	public func makePackageLandingNetwork() -> PackageLandingNetwork {
		return PackageLandingNetwork(network: Network<PackagesLandingNetworkModel.Response>(apiEndpoint))
        //return PackageLandingNetwork(network: Network<PackagesLandingNetworkModel.Response>(mockBaseURL))
	}
	
	public func makeCampaignDetailsNetwork() -> CampaignDetailsNetwork {
		return CampaignDetailsNetwork(network: Network<FestivalCampaignNetworkModel.Response>(apiEndpoint))
        //return CampaignDetailsNetwork(network: Network<FestivalCampaignNetworkModel.Response>(mockBaseURL))
	}
	
	public func makeQuizResultNetwork() -> QuizResultNetwork {
		return QuizResultNetwork(resultNetwork: Network<QuizResultNetwrokModel.Response>(apiEndpoint))
      //  return QuizResultNetwork(resultNetwork: Network<QuizResultNetwrokModel.Response>(mockBaseURL))
	}
	//Extra
	public func makeStatisticsSceneNetwork() -> StatisticsSceneNetwork {
		return StatisticsSceneNetwork(Statistics: Network<StatisticsRanksNetworkModel.Response>(apiEndpoint))
        //return StatisticsSceneNetwork(Statistics: Network<StatisticsRanksNetworkModel.Response>(mockBaseURL))
	}
	
	public func makeVideoNewsNetwork() -> VideoNewsNetwork {
		return VideoNewsNetwork(Video: Network<VideoNetworkModel.Response>(apiEndpoint), News: Network<NewsNetworkModel.Response>(apiEndpoint))
        //return VideoNewsNetwork(Video: Network<VideoNetworkModel.Response>(mockBaseURL), News: Network<NewsNetworkModel.Response>(mockBaseURL))
	}
	
	public func makeLeaderBoardNetwork() -> LeaderBoardNetwork {
		//return LeaderBoardNetwork(LeaderNetwrok: Network<LeaderBoardNetworkModel.Response>(apiEndpoint))
        return LeaderBoardNetwork(LeaderNetwrok: Network<LeaderBoardNetworkModel.Response>(mockBaseURL))
	}
	
	public func makeInviteFriendsNetwork() -> InviteFriendsNetwork {
        let getInviteCode = Network<InviteFriendsNetworkModel.GetInviteCode.Response>(apiEndpoint)
        let sendInviteCode = Network<InviteFriendsNetworkModel.SendInviteCode.Response>(apiEndpoint)
        //let getInviteCode = Network<InviteFriendsNetworkModel.GetInviteCode.Response>(mockBaseURL)
        //let sendInviteCode = Network<InviteFriendsNetworkModel.SendInviteCode.Response>(mockBaseURL)
		return InviteFriendsNetwork(getInviteNetwork: getInviteCode, sendInviteNetwork:sendInviteCode)
	}
	
	public func makePreferenceNetwork() -> PreferencesNetwork{

		return PreferencesNetwork(network: Network<PreferencesNetworkModel.Response>(apiEndpoint))
        //return PreferencesNetwork(network: Network<PreferencesNetworkModel.Response>(mockBaseURL))
	}
    
    public func makeRecommendedNetwork() -> RecommendedsNetwork{
        return RecommendedsNetwork(network: Network<RecommendedPackagesNetworkModel.Response>(apiEndpoint))
        //return RecommendedsNetwork(network: Network<RecommendedPackagesNetworkModel.Response>(mockBaseURL))
    }
}
