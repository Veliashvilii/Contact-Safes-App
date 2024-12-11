//
//  PresetMessage.swift
//  ContactSafesApp
//
//  Created by Metehan Veliashvili on 9.12.2024.
//

import Foundation

enum PresetMessage: String, CaseIterable {
    // General Support
    case needToTalk = """
        Hey, I'm going through a tough time right now and could really use someone to talk to. \
        Would you have some time for a conversation? It would mean a lot to me.
        """
    case notFeelingWell = """
        I wanted to let you know that I'm not feeling my best today, both emotionally and mentally. \
        It would be really helpful if you could check in on me when you have a moment.
        """
    case needSupport = """
        I'm reaching out because I could use some support right now. Nothing serious, \
        but having a friendly voice would really help me feel better. Are you available for a chat?
        """
    
    // Emotional Support
    case feelingOverwhelmed = """
        Everything feels a bit overwhelming today, and I'm having trouble managing my thoughts and emotions. \
        Would you mind talking with me for a while? Your presence always helps me feel more grounded.
        """
    case feelingAnxious = """
        My anxiety is particularly high today, and I'm struggling to keep calm. Could you help me work through this? \
        Maybe we could talk or you could share some calming techniques that work for you.
        """
    case feelingLonely = """
        I've been feeling quite isolated and lonely lately. It would really brighten my day if we could connect, \
        even if it's just for a brief conversation or a quick video call.
        """
    
    // Emergency
    case needEmergencyHelp = """
        I'm in a situation where I need immediate help and support. \
        Please call me as soon as you see this message. It's urgent, and I really need someone I trust right now.
        """
    case needAssistance = """
        I'm facing a difficult situation that I can't handle alone, and I really need your help. \
        Could you please reach out to me as soon as possible? I value your support and guidance.
        """
    case urgentSupport = """
        This is urgent - I'm not in a good place right now and really need your support. \
        If you're available, please call or come over. I don't want to be alone at this moment.
        """
    
    // Check-in Requests
    case checkInRequest = """
        Would you mind checking in on me periodically today? I'm going through some challenges, \
        and knowing someone is thinking of me would help me feel more secure and supported.
        """
    case needCompany = """
        I could really use some company today. If you're free, maybe we could spend some time together? \
        We could just talk, go for a walk, or do something that might help lift my spirits.
        """
    case callRequest = """
        When you have a moment, could you give me a call? There's a lot on my mind that I'd like to share \
        with someone who understands me. No rush, but I'd really appreciate hearing your voice today.
        """
    
    // Positive Messages
    case wantToShare = """
        Something's been on my mind lately, and I'd really value your perspective on it. \
        Could we set aside some time to talk? Your insights always help me see things more clearly.
        """
    case needAdvice = """
        I'm facing a situation where I could really use your advice and wisdom. \
        You always have a way of helping me see things from a different angle. Would you have some time to discuss it?
        """
    case justChecking = """
        Hey, I know life gets busy, but I was wondering if you might have some time to catch up? \
        It would be really nice to connect and share what's been going on in our lives.
        """

    var message: String {
        return self.rawValue
    }
    
    static var groupedMessages: [String: [PresetMessage]] {
        [
            "General Support": [.needToTalk, .notFeelingWell, .needSupport],
            "Emotional Support": [.feelingOverwhelmed, .feelingAnxious, .feelingLonely],
            "Emergency": [.needEmergencyHelp, .needAssistance, .urgentSupport],
            "Check-in Requests": [.checkInRequest, .needCompany, .callRequest],
            "Positive Messages": [.wantToShare, .needAdvice, .justChecking]
        ]
    }
}
