from naoqi import *
import PepperModule
from Emotion import Emotion
from Topics import topic_content_1
from Utils import activities_running

# ----------------------------------------------------------------------------Robot
# class---------------------------------------------------------------------------------------------

"""--------------------------------------------------------------------------Robot 
class--------------------------------------------------------------------------------------------- """


# ----------------------------------------------------------------------------Robot
# class---------------------------------------------------------------------------------------------
class Robot:
    def __init__(self, session, HOST):
        self.session = session
        self.alBroker = ALBroker("myBroker", "0.0.0.0", 7896, HOST, 9559)
        self.alProxy = ALProxy("ALMemory")
        self.alMood = session.service("ALMood")
        self.alTexToSpeech = session.service("ALTextToSpeech")
        self.alAnimationPlayer = session.service("ALAnimationPlayer")
        self.alMotion = session.service("ALMotion")
        self.alRobotPosture = session.service("ALRobotPosture")
        self.alFaceDetection = session.service("ALFaceDetection")
        self.alAutonomousBlinking = session.service("ALAutonomousBlinking")
        self.alBackgroundMovement = session.service("ALBackgroundMovement")
        self.alBasicAwareness = session.service("ALBasicAwareness")
        self.alListeningMovement = session.service("ALListeningMovement")
        self.alSpeakingMovementProxy = session.service("ALSpeakingMovement")
        self.alMotionProxy = session.service("ALMotion")
        self.alPeoplePerception = session.service("ALPeoplePerception")
        self.alBatteryProxy = session.service("ALBattery")
        self.alBodyTemperatureProxy = session.service("ALBodyTemperature")
        self.alUserSession = session.service("ALUserSession")
        self.alNavigationProxy = session.service("ALNavigation")
        self.alLocalizationProxy = session.service("ALLocalization")
        self.alSensorsProxy = session.service("ALSensors")
        self.alLedsProxy = session.service("ALLeds")
        self.alTabletService = session.service("ALTabletService")
        self.alAnimatedSpeech = session.service("ALAnimatedSpeech")
        self.alAudioDevice = session.service("ALAudioDevice")
        self.alAudioPlayer = session.service("ALAudioPlayer")
        self.alVoiceEmotionAnalysis = session.service("ALVoiceEmotionAnalysis")
        self.alSpeechRecognition = session.service("ALSpeechRecognition")
        self.alDialogProxy = session.service("ALDialog")
        self.emotionStateRobot = Emotion()
        self.alDialogProxy.setLanguage("Spanish")
        self.topicMap = {}
        self.topicContentMap = {"basic": topic_content_1}

        # The list have the function on the first place, if the activity most return an ack on the second, type on the third and callback response the fourth

        self.__modules = {
            # ActivityServices-------------------------------------------------------
            "RUNANIMATION": [self.run_animation, True, "act", True],  # funcionando
            "GOTOPOSTURE": [self.go_to_posture, False, "rob", False],  # No hace nada-------------------------
            "DETECTNEWFACE ": [self.learn_face, True, "int", False],  # funcionando
            "GETFACELIST": [self.get_face_list, False, "int", False],  # funcionando
            "ACTIVATE": [self.activate_blinking, True, "rob", False],  # Parece que funciona, no bota error
            "ACTIVATELIFESIGNALS": [self.activate_life_signals, True, "rob", False],  #
            "ACTIVATELIFESGINALSINT": [self.activate_life_signals_awareness, True, "rob", False],  #
            "DEFENGAGEMENTTYPE": [self.set_engagement_type, False, "int", False],  #
            "ACTIVATEACTIVEHEARING": [self.activate_hearing_movement, True, "rob", False],  #
            "ACTIVATESPEAKMOVEMENTS": [self.activate_speak_movements, True, "rob", False],  #
            "DEFCONVERSATIONMODE": [self.define_conversation_mode, True, "int", False],  #
            "ACTIVATEPUSHREFLEXES": [self.activate_push_reflexes, True, "rob", False],  #
            "ACIVATEBREATHMOV": [self.activate_breath_movement, True, "rob", False],  #
            "ACTIVATEMOVDETECTION": [self.activate_movement_detection, True, "rob", False],  #
            "ACTIVATEFACEDETEC": [self.activate_face_detection, True, "rob", False],  #
            "ACTIVATECOLISSIONDETECT": [self.activate_colission_detection, True, "rob", False],  #
            # EnergyServices-------------------------------------------------------
            "ACTIVATEMONITORINGCHARGESERV": [self.activate_monitoring_charge_service, True, "rob", False],  #
            "GETBATTERY": [self.get_battery, False, "rob", False],  #
            "GETTEMP": [self.get_temperature, False, "rob", False],  #
            # HumanServices-------------------------------------------------------
            "GETEMOTIONSTATE": [self.get_emotion_state, False, "emo", False],  #
            "LOGIN": [self.login, False, "act", False],  #
            # LocationServices-------------------------------------------------------
            "SEARCHFREEZONE": [self.search_free_zone, False, "act", False],  #
            "GETFREEZONES": [self.get_free_zone, False, "act", False],  #
            "GETROBOTPOSITION": [self.get_robot_position, False, "act", False],  #
            # MovementServices-------------------------------------------------------
            "MOVE": [self.move, True, "act", True],  ##################################################################
            "MOVEFORWARD": [self.move_forward, True, "act", True],  #
            "MOVETO": [self.move_to, True, "act", True],  #
            "MOVETOPOSITION": [self.move_to_position, True, "act", True],  #
            # RobotStateServices-------------------------------------------------------
            "WAKEUP": [self.wake_up, True, "act", False],  #
            "SUSPEND": [self.suspend, True, "act", False],  #
            "SETREFRESHTIMESENSORS": [self.set_refresh_time_sensors, False, "act", False],
            # Hay que crear un modulo para probar
            "ACTIVATERASTA ": [self.activate_rasta, False, "act", False],  #
            "RANDOMEYES": [self.random_eyes, False, "act", False],  #
            "SETLEDSINTENSITY": [self.set_leds_intensity, True, "act", False],  #
            "CHANGELEDCOLOR": [self.change_led_color, True, "act", False],  #
            "ACTIVATESTIFFNESS": [self.activate_stiffness, True, "act", False],  #
            "ROBOTEMOTION": [self.change_emotion_expression, False, "rob", False],
            # TabletServices-------------------------------------------------------
            "TABLETON": [self.tablet_on, True, "act", False],
            "WAKETABLET": [self.wake_tablet, True, "act", False],
            "SUSPENDTABLET": [self.suspend_tablet, True, "act", False],
            "TABLETOFF": [self.tablet_off, True, "act", False],
            "SHOWVIDEO": [self.show_video, False, "act", True],
            "QUITVIDEO": [self.quit_video, False, "act", False],
            "PAUSEVIDEO": [self.pause_video, False, "act", False],
            "RESUMEVIDEO": [self.resume_video, False, "act", False],
            "PRELOADIMG": [self.preload_image, False, "act", False],
            "SHOWIMG": [self.show_image, True, "act", True],
            "HIDEIMG": [self.hide_image, True, "act", False],
            "SETTABLETBRIGHT": [self.set_tablet_bright, True, "act", False],
            "SETTABLETVOL": [self.set_tablet_volume, True, "act", False],
            # VoiceServices-------------------------------------------------------
            "SAY": [self.say, True, "act", True],
            "STOPALL": [self.stop_all, True, "act", False],
            "SETSAYVOLUMN": [self.set_say_volume, True, "act", False],
            "SAYWITHMOVEMENT": [self.say_with_movement, True, "act", True],
            # -------------------------Callback realizado
            "SETSYSTEMVOLUME": [self.set_system_volume, True, "act", False],
            "PLAYSOUND": [self.play_sound, True, "act", True],
            "PAUSESOUND": [self.pause_sound, True, "act", False],
            "ACTIVATEVOICEEMOANAL": [self.activate_voice_emotion_analysis, True, "act", False],
            "DESACTIVVOICEEMOANAL": [self.desactivate_voice_emotion_analysis, True, "act", False],
            "ACTVOICERECOG": [self.activate_voice_recognition, True, "act", False],
            "DESACTVOICERECOG": [self.desactivate_voice_recognition, True, "act", False],
            "LOADCONVTOPIC": [self.load_conversational_topic, True, "act", False],
            "UNLOADCONVTOPIC": [self.unload_conversational_topic, True, "act", False],
            "DEACTCONVTOPIC": [self.desactivate_conversational_topic, True, "act", False],
            "SAYUNDERTOPICCONTEXT": [self.say_under_topic_context, True, "act", True],
            "SETTOPICFOCUS": [self.set_topic_focus, True, "act", False]
        }

        # Declare the modules --------------------------------------------------------------------------------

        try:

            self.sensorsModule = PepperModule.pepperModule("sensorsModule")
            # Raised when an animated speech is done.
            self.alProxy.subscribeToEvent("ALAnimatedSpeech/EndOfAnimatedSpeech", "sensorsModule",
                                          "endOfAnimatedSpeech")
            # Raised when the person tracked can no longer be found for some time.
            self.alProxy.subscribeToEvent("ALBasicAwareness/HumanLost", "sensorsModule",
                                          "humanLost")  # DEBE TENER DETECTADA UNA CARA PARA FUNCIONAR

            # Raised when the robot begins to track a person, when the tracked person is lost, or when the tracked person's ID is|
            self.alProxy.subscribeToEvent("ALBasicAwareness/HumanTracked", "sensorsModule", "humanTracked")

            # Raised when a stimulus is detected.
            # types of stimulus: http://doc.aldebaran.com/2-5/naoqi/interaction/autonomousabilities/albasicawareness.html#albasicawareness-stimuli-types
            self.alProxy.subscribeToEvent("ALBasicAwareness/StimulusDetected", "sensorsModule", "stimulusDetected")

            # Raised when the battery level is low and will soon need charging.
            self.alProxy.subscribeToEvent("ALBattery/BatteryLow", "sensorsModule",
                                          "batteryLow")  # DEBE TENER LA BATERiA BAJA PARA FUNCIONAR

            # Raised when the robot could not reach its destination, either because it was lost or because it was interrupted by an obstacle.
            self.alProxy.subscribeToEvent("ALLocalization/GoToFailed", "sensorsModule",
                                          "goToFailed")  # NO MUESTRA NADA -

            # Raised when the robot has successfully reached its destination.
            self.alProxy.subscribeToEvent("ALLocalization/GoToSuccess", "sensorsModule", "goToSuccess")

            # Raised when the robot gets lost while trying to go to its destination.
            self.alProxy.subscribeToEvent("ALLocalization/GoToLost", "sensorsModule", "goToLost")

            # Raised when the localization is successful.
            self.alProxy.subscribeToEvent("ALLocalization/LocalizeSuccess", "sensorsModule", "localizeSuccess")

            # Raised when the localization fails and the robot is lost.
            self.alProxy.subscribeToEvent("ALLocalization/LocalizeLost", "sensorsModule", "localizeLost")

            # Raised when the orientation of the robot has NOT been successfully retrieved.
            self.alProxy.subscribeToEvent("ALLocalization/LocalizeDirectionLost", "sensorsModule",
                                          "localizeDirectionLost")

            # Raised when the orientation of the robot has been successfully retrieved.
            self.alProxy.subscribeToEvent("ALLocalization/LocalizeDirectionSuccess", "sensorsModule",
                                          "localizeDirectionSuccess")

            # Raised when a chain velocity is clipped because an obstacle is too close.
            self.alProxy.subscribeToEvent("ALMotion/Safety/ChainVelocityClipped", "sensorsModule",
                                          "chainVelocityClipped")

            # Raised when a move command fails.
            self.alProxy.subscribeToEvent("ALMotion/MoveFailed", "sensorsModule", "moveFailed")

            # Raised when the awake status of the robot changes.
            self.alProxy.subscribeToEvent("robotIsWakeUp", "sensorsModule", "robotIsWakeUp")

            # Raised at ALMotionProxy::wakeUp finish.
            self.alProxy.subscribeToEvent("ALMotion/Stiffness/wakeUpFinished", "sensorsModule", "wakeUpFinished")
            # Raised at ALMotionProxy::rest finish.
            self.alProxy.subscribeToEvent("ALMotion/Stiffness/restFinished", "sensorsModule", "restFinished")

            # Raised when devices availability changed. When a device is not available the stiffness and movement on this device are prohibited.
            self.alProxy.subscribeToEvent("ALMotion/Protection/DisabledDevicesChanged", "sensorsModule",
                                          "disabledDevicesChanged")

            # Raised when features (Move, Stiffness...) availability changed.
            self.alProxy.subscribeToEvent("ALMotion/Protection/DisabledFeaturesChanged", "sensorsModule",
                                          "disabledFeaturesChanged")

            # Raised when Pepper is correctly docked onto the charging station.
            self.alProxy.subscribeToEvent("ALRecharge/ConnectedToChargingStation", "sensorsModule",
                                          "connectedToChargingStation")

            # Raised when Pepper interrupts his operation because a safety rule prevents the usage of ALMotion module.
            self.alProxy.subscribeToEvent("ALRecharge/MoveFailed", "sensorsModule", "moveFailedRecharging")

            # Raised when Pepper failed to leave his charging station due to an obstacle in the way.
            self.alProxy.subscribeToEvent("ALRecharge/LeaveFailed", "sensorsModule", "leaveFailed")

            # Raised when one of the specified words set with ALSpeechRecognitionProxy::setVocabulary has been recognized. When no word is currently recognized, this value is reinitialized.
            self.alProxy.subscribeToEvent("WordRecognized", "sensorsModule", "wordRecognized")

            # Raised when the automatic speech recognition engine has detected a voice activity.
            self.alProxy.subscribeToEvent("SpeechDetected", "sensorsModule", "speechDetected")

            # Raised when an error occurs.
            self.alProxy.subscribeToEvent("ALTabletService/error", "sensorsModule", "tabletError")

            # Raised when message occurs.
            self.alProxy.subscribeToEvent("ALTabletService/message", "sensorsModule", "tabletMessage")

            # Raised when text input occurs.
            self.alProxy.subscribeToEvent("ALTabletService/onInputText", "sensorsModule", "onInputText")

            # Raised when a valid tactile gesture has been detected
            self.alProxy.subscribeToEvent("ALTactileGesture/Gesture", "sensorsModule", "gesture")

            # Raised when the current sentence synthesis is done.
            self.alProxy.subscribeToEvent("ALTextToSpeech/TextDone", "sensorsModule", "speechTextDone")

            # Raised when the current sentence synthesis is interrupted, for example by ALTextToSpeechProxy::stopAll.
            self.alProxy.subscribeToEvent("ALTextToSpeech/TextInterrupted", "sensorsModule", "speechTextInterrupted")
            # Raised when an utterance has been analyzed.
            self.alProxy.subscribeToEvent("ALVoiceEmotionAnalysis/EmotionRecognized", "sensorsModule",
                                          "voiceEmotionRecognized")
            # Raised whenever an activity completes its execution and exits.
            self.alProxy.subscribeToEvent("AutonomousLife/CompletedActivity", "sensorsModule",
                                          "autonomousCompletedActivity")

            # Revisar esto para ver si se va a colocar!!!!!!!!!!!!!!!!!!!!!!!!

            # Raised when the robot touch status changed.
            self.alProxy.subscribeToEvent("TouchChanged", "sensorsModule",
                                          "pythondatachanged")  ###########################

            # Raised when at least one device (joint, actuator, sensor) has a high temperature.
            self.alProxy.subscribeToEvent("HotDeviceDetected", "sensorsModule", "hotDeviceDetected")
            # Raised each time the robot catches a human input. Contains the last human input.
            self.alProxy.subscribeToEvent("Dialog/LastInput", "sensorsModule", "dialogLastInput")
            # Raised when the dialog engine starts or stops. The value is "1" for start, "0" for stop.
            self.alProxy.subscribeToEvent("Dialog/IsStarted", "sensorsModule", "dialogIsStarted")
            # Currently processed human input.
            self.alProxy.subscribeToEvent("Dialog/CurrentString", "sensorsModule", "dialogCurrentString")
            # Raised when a person just moved away from the robot (i.e. moved to a further engagement zone).
            self.alProxy.subscribeToEvent("EngagementZones/PersonMovedAway", "sensorsModule", "personMovedAway")
            # Raised when a person just approached the robot (i.e. moved to a closer engagement zone).
            self.alProxy.subscribeToEvent("EngagementZones/PersonApproached", "sensorsModule", "personApproached")
            # Raised when a person has a smile value above the current threshold (default = 0.7).
            self.alProxy.subscribeToEvent("FaceCharacteristics/PersonSmiling", "sensorsModule", "personSmiling")
            # #Raised when one or several faces are currently being detected.
            self.alProxy.subscribeToEvent("FaceDetected", "sensorsModule", "faceDetected")
            # Raised each time the list of people looking at the robot changes.
            self.alProxy.subscribeToEvent("GazeAnalysis/PeopleLookingAtRobot", "sensorsModule", "peopleLookingAtRobot")
            # Raised when someone turns his head away from the robot.
            self.alProxy.subscribeToEvent("GazeAnalysis/PersonStopsLookingAtRobot", "sensorsModule",
                                          "personStopsLookingAtRobot")
            # The distance in meters to the tracked human. -1.0 if no one is tracked.
            self.alProxy.subscribeToEvent("Launchpad/DistanceOfTrackedHuman", "sensorsModule", "distanceOfTrackedHuman")
            # Raised when an obstacle is detected in the close area.
            self.alProxy.subscribeToEvent("Navigation/AvoidanceNavigator/ObstacleDetected", "sensorsModule",
                                          "obstacleDetected")
            # Raised whenever at least one person is visible by the robot. Contains information about the detected people, it is used by ALTracker to track people.
            self.alProxy.subscribeToEvent("PeoplePerception/PeopleDetected", "sensorsModule", "peopleDetected")
            # Raised when a new preference is added to the system.
            self.alProxy.subscribeToEvent("preferenceAdded", "sensorsModule", "preferenceAdded")
            # Raised when the value of a preference has been updated.
            self.alProxy.subscribeToEvent("preferenceChanged", "sensorsModule", "preferenceChanged")
            # Raised when something just waved at the robot.
            self.alProxy.subscribeToEvent("WavingDetection/Waving", "sensorsModule", "wavingDetection")
            # Raised when someone just waved at the robot.
            self.alProxy.subscribeToEvent("WavingDetection/PersonWaving", "sensorsModule", "personWaving")
            #
            self.alProxy.subscribeToEvent("Dialog/LastInput", "sensorsModule", "getDialogInput")

        except Exception, e:
            print "Main Error"
            print e
            self.alBroker.shutdown()
            exit(1)

    def getFunction(self, fun):
        return self.__modules.get(fun)[0]

    def getAck(self, fun):
        return self.__modules.get(fun)[1]

    def getType(self, fun):
        return self.__modules.get(fun)[2]

    def mustBeResponse(self, fun):
        return self.__modules.get(fun)[3]

    def run_animation(self, params):
        # Get the function
        animation_name = params.get("TAGSDANCE")
        # Get the params of the function
        animation_factor = params.get("FACTOR")
        # Invoke the function
        animation_name(animation_factor)

    def getEmotionalReaction(self):
        # Returns:	The detected reaction.
        return self.alMood.getEmotionalReaction()

    def getAttention(self):
        # "unengaged": attentionLevel < 0.6
        # "semiEngaged" : 0.6 <= attentionLevel < 0.9
        # "fullyEngaged": attentionLevel >= 0.9
        return self.alMood.attention()

    def play_animation(self, animation_names, animation_times, animation_keys):
        try:
            # uncomment the following line and modify the IP if you use this script outside Choregraphe.
            # motion = ALProxy("ALMotion", IP, 9559)
            self.alMotion.angleInterpolationBezier(animation_names, animation_times, animation_keys)
        except BaseException, err:
            print err

    # def run_animation( animation_path, animation_tag):
    #    alAnimationPlayer.runTag(animation_path, animation_tag)
    # Choregraphe bezier export in Python.

    def dance_macarena(self, factor=1):
        # Choregraphe bezier export in Python.
        names = list()
        times = list()
        keys = list()

        names.append("HeadPitch")
        times.append([0, 1.16, 2.36, 4.76, 5.96, 8.36, 9.56, 11.96, 14.36, 16.36])
        keys.append([[-0.211185, [3, -0.0133333, 0], [3, 0.386667, 0]], [-0.211185, [3, -0.386667, 0], [3, 0.4, 0]],
                     [-0.211185, [3, -0.4, 0], [3, 0.8, 0]], [0.123918, [3, -0.8, 0], [3, 0.4, 0]],
                     [0.123918, [3, -0.4, 0], [3, 0.8, 0]], [0.445059, [3, -0.8, 0], [3, 0.4, 0]],
                     [0.123918, [3, -0.4, 0], [3, 0.8, 0]], [0.123918, [3, -0.8, 0], [3, 0.8, 0]],
                     [0.123918, [3, -0.8, 0], [3, 0.666667, 0]], [0.123918, [3, -0.666667, 0], [3, 0, 0]]])

        names.append("HeadYaw")
        times.append([0, 1.16, 2.36, 4.76, 5.96, 8.36, 9.56, 11.96, 13.16, 14.36, 16.36])
        keys.append([[-0.00698132, [3, -0.0133333, 0], [3, 0.386667, 0]], [0.219911, [3, -0.386667, 0], [3, 0.4, 0]],
                     [-0.00698132, [3, -0.4, 0.064965], [3, 0.8, -0.12993]], [-0.364774, [3, -0.8, 0], [3, 0.4, 0]],
                     [-0.0174533, [3, -0.4, -0.00523599], [3, 0.8, 0.010472]], [-0.00698132, [3, -0.8, 0], [3, 0.4, 0]],
                     [-0.00698132, [3, -0.4, 0], [3, 0.8, 0]], [0.329867, [3, -0.8, 0], [3, 0.4, 0]],
                     [-0.118682, [3, -0.4, 0], [3, 0.4, 0]], [0.127409, [3, -0.4, 0], [3, 0.666667, 0]],
                     [-0.0314159, [3, -0.666667, 0], [3, 0, 0]]])

        names.append("HipPitch")
        times.append([0, 1.16, 8.36])
        keys.append([[-0.0357826, [3, -0.0133333, 0], [3, 0.386667, 0]], [-0.0474347, [3, -0.386667, 0], [3, 2.4, 0]],
                     [0, [3, -2.4, 0], [3, 0, 0]]])

        names.append("HipRoll")
        times.append([0, 1.16, 8.36])
        keys.append([[-0.0041018, [3, -0.0133333, 0], [3, 0.386667, 0]], [-0.00654055, [3, -0.386667, 0], [3, 2.4, 0]],
                     [-0.00523599, [3, -2.4, 0], [3, 0, 0]]])

        names.append("KneePitch")
        times.append([0, 1.16, 8.36])
        keys.append([[-0.0133719, [3, -0.0133333, 0], [3, 0.386667, 0]], [-0.0163339, [3, -0.386667, 0], [3, 2.4, 0]],
                     [0, [3, -2.4, 0], [3, 0, 0]]])

        names.append("LElbowRoll")
        times.append([0, 1.16, 2.36, 4.76, 9.56, 13.16, 14.36, 16.36])
        keys.append([[-1.56207, [3, -0.0133333, 0], [3, 0.386667, 0]], [-0.00872665, [3, -0.386667, 0], [3, 0.4, 0]],
                     [-0.00872665, [3, -0.4, 0], [3, 0.8, 0]], [-0.00872665, [3, -0.8, 0], [3, 1.6, 0]],
                     [-0.00872665, [3, -1.6, 0], [3, 1.2, 0]], [-1.37357, [3, -1.2, 0.120428], [3, 0.4, -0.0401426]],
                     [-1.41372, [3, -0.4, 0], [3, 0.666667, 0]], [-1.41372, [3, -0.666667, 0], [3, 0, 0]]])

        names.append("LElbowYaw")
        times.append([0, 1.16, 2.36, 3.56, 4.76, 9.56, 13.16, 14.36, 16.36])
        keys.append([[-0.118682, [3, -0.0133333, 0], [3, 0.386667, 0]], [-0.118682, [3, -0.386667, 0], [3, 0.4, 0]],
                     [-0.118682, [3, -0.4, 0], [3, 0.4, 0]], [0.722566, [3, -0.4, 0], [3, 0.4, 0]],
                     [0.722566, [3, -0.4, 0], [3, 1.6, 0]], [-1.80816, [3, -1.6, 0], [3, 1.2, 0]],
                     [-0.197222, [3, -1.2, 0], [3, 0.4, 0]],
                     [-0.830777, [3, -0.4, 0.0115192], [3, 0.666667, -0.0191987]],
                     [-0.849975, [3, -0.666667, 0], [3, 0, 0]]])

        names.append("LHand")
        times.append([0, 1.16, 2.36, 3.56])
        keys.append([[0.02, [3, -0.0133333, 0], [3, 0.386667, 0]], [0.2, [3, -0.386667, 0], [3, 0.4, 0]],
                     [0.2, [3, -0.4, 0], [3, 0.4, 0]], [0.87, [3, -0.4, 0], [3, 0, 0]]])

        names.append("LShoulderPitch")
        times.append([0, 1.16, 2.36, 3.56, 4.76, 9.56, 13.16, 14.36, 16.36])
        keys.append([[1.32994, [3, -0.0133333, 0], [3, 0.386667, 0]], [1.7558, [3, -0.386667, 0], [3, 0.4, 0]],
                     [-1.22173, [3, -0.4, 0], [3, 0.4, 0]], [0.0837758, [3, -0.4, 0], [3, 0.4, 0]],
                     [0.0837758, [3, -0.4, 0], [3, 1.6, 0]], [0.0837758, [3, -1.6, 0], [3, 1.2, 0]],
                     [0.0837758, [3, -1.2, 0], [3, 0.4, 0]], [-0.289725, [3, -0.4, 0], [3, 0.666667, 0]],
                     [1.69821, [3, -0.666667, 0], [3, 0, 0]]])

        names.append("LShoulderRoll")
        times.append([0, 1.16, 2.36, 3.56, 4.76, 9.56, 13.16, 14.36, 16.36])
        keys.append([[0.792379, [3, -0.0133333, 0], [3, 0.386667, 0]], [0.792379, [3, -0.386667, 0], [3, 0.4, 0]],
                     [0.00872665, [3, -0.4, 0], [3, 0.4, 0]], [0.198968, [3, -0.4, 0], [3, 0.4, 0]],
                     [0.198968, [3, -0.4, 0], [3, 1.6, 0]], [0.198968, [3, -1.6, 0], [3, 1.2, 0]],
                     [0.0226893, [3, -1.2, 0], [3, 0.4, 0]],
                     [0.525344, [3, -0.4, -0.00837757], [3, 0.666667, 0.0139626]],
                     [0.539307, [3, -0.666667, 0], [3, 0, 0]]])

        names.append("LWristYaw")
        times.append([0, 1.16, 2.36, 4.76, 9.56, 13.16, 14.36])
        keys.append([[-0.708604, [3, -0.0133333, 0], [3, 0.386667, 0]], [-0.708604, [3, -0.386667, 0], [3, 0.4, 0]],
                     [-0.708604, [3, -0.4, 0], [3, 0.8, 0]], [-0.708604, [3, -0.8, 0], [3, 1.6, 0]],
                     [-0.708604, [3, -1.6, 0], [3, 1.2, 0]], [-0.301942, [3, -1.2, -0.0314158], [3, 0.4, 0.0104719]],
                     [-0.29147, [3, -0.4, 0], [3, 0, 0]]])

        names.append("RElbowRoll")
        times.append([0, 1.16, 4.76, 5.96, 10.76, 11.96, 15.56, 17.56])
        keys.append([[1.56207, [3, -0.0133333, 0], [3, 0.386667, 0]], [1.56207, [3, -0.386667, 0], [3, 1.2, 0]],
                     [0.00872665, [3, -1.2, 0], [3, 0.4, 0]], [0.00872665, [3, -0.4, 0], [3, 1.6, 0]],
                     [0.00872665, [3, -1.6, 0], [3, 0.4, 0]], [1.41372, [3, -0.4, 0], [3, 1.2, 0]],
                     [1.41372, [3, -1.2, 0], [3, 0.666667, 0]], [1.41372, [3, -0.666667, 0], [3, 0, 0]]])

        names.append("RElbowYaw")
        times.append([0, 1.16, 4.76, 5.96, 7.16, 10.76, 11.96, 14.36, 15.56, 17.56])
        keys.append([[0.118682, [3, -0.0133333, 0], [3, 0.386667, 0]], [0.118682, [3, -0.386667, 0], [3, 1.2, 0]],
                     [0.118682, [3, -1.2, 0], [3, 0.4, 0]], [0.118682, [3, -0.4, 0], [3, 0.4, 0]],
                     [-0.722566, [3, -0.4, 0], [3, 1.2, 0]], [1.80816, [3, -1.2, 0], [3, 0.4, 0]],
                     [0.13439, [3, -0.4, 0], [3, 0.8, 0]], [0.150098, [3, -0.8, -0.015708], [3, 0.4, 0.00785399]],
                     [0.849975, [3, -0.4, 0], [3, 0.666667, 0]], [0.849975, [3, -0.666667, 0], [3, 0, 0]]])

        names.append("RHand")
        times.append([0, 1.16, 7.16, 10.76])
        keys.append([[0.02, [3, -0.0133333, 0], [3, 0.386667, 0]], [0.2, [3, -0.386667, -0.0459032], [3, 2, 0.23743]],
                     [0.87, [3, -2, 0], [3, 1.2, 0]], [0.87, [3, -1.2, 0], [3, 0, 0]]])

        names.append("RShoulderPitch")
        times.append([0, 1.16, 4.76, 5.96, 7.16, 10.76, 15.56, 17.56])
        keys.append([[1.32994, [3, -0.0133333, 0], [3, 0.386667, 0]], [1.32994, [3, -0.386667, 0], [3, 1.2, 0]],
                     [0.127409, [3, -1.2, 0.605629], [3, 0.4, -0.201876]], [-1.09258, [3, -0.4, 0], [3, 0.4, 0]],
                     [0.0837758, [3, -0.4, 0], [3, 1.2, 0]], [0.0837758, [3, -1.2, 0], [3, 1.6, 0]],
                     [-0.300197, [3, -1.6, 0], [3, 0.666667, 0]], [1.69821, [3, -0.666667, 0], [3, 0, 0]]])

        names.append("RShoulderRoll")
        times.append([0, 1.16, 4.76, 5.96, 7.16, 10.76, 11.96, 15.56, 17.56])
        keys.append([[-0.792379, [3, -0.0133333, 0], [3, 0.386667, 0]], [-0.792379, [3, -0.386667, 0], [3, 1.2, 0]],
                     [-0.792379, [3, -1.2, 0], [3, 0.4, 0]], [-0.0314159, [3, -0.4, -0.0226893], [3, 0.4, 0.0226893]],
                     [-0.00872665, [3, -0.4, 0], [3, 1.2, 0]], [-0.200713, [3, -1.2, 0], [3, 0.4, 0]],
                     [-0.00872665, [3, -0.4, 0], [3, 1.2, 0]], [-0.539307, [3, -1.2, 0], [3, 0.666667, 0]],
                     [-0.539307, [3, -0.666667, 0], [3, 0, 0]]])

        names.append("RWristYaw")
        times.append([0, 1.16, 4.76, 5.96, 10.76, 15.56, 17.56])
        keys.append([[0.708604, [3, -0.0133333, 0], [3, 0.386667, 0]], [-0.708604, [3, -0.386667, 0], [3, 1.2, 0]],
                     [0.708604, [3, -1.2, 0], [3, 0.4, 0]], [0.708604, [3, -0.4, 0], [3, 1.6, 0]],
                     [0.708604, [3, -1.6, 0], [3, 1.6, 0]], [0.29147, [3, -1.6, 0], [3, 0.666667, 0]],
                     [0.29147, [3, -0.666667, 0], [3, 0, 0]]])

        try:
            # uncomment the following line and modify the IP if you use this script outside Choregraphe.
            # motion = ALProxy("ALMotion", IP, 9559)
            # motion = ALProxy("ALMotion")
            # motion.angleInterpolationBezier(names, times, keys)
            map(lambda i: i * factor, times)
            self.play_animation(names, times, keys)
        except BaseException, err:
            print err

    # Prueba!!!!!!!!!

    def go_to_posture(self, params):
        posture = params.get("postura")
        speed = params("velocidad")
        self.alRobotPosture.goToPosture(posture, speed)

    # Learns a new face and adds it in the database under the specified name.
    def learn_face(self, params):
        person_name = params.get("DETECTPWA")
        # Returns: true if the operation succeeded
        return self.alFaceDetection.learnFace(person_name)

    # Gets a list containing the name of each learned face. The size of this list is always
    # equal to the number of faces in the data base.
    def get_face_list(self):
        return self.alFaceDetection.getLearnedFacesList()

    # Enables or disables the autonomous blinking.
    def activate_blinking(self, params):
        enabled = params.get("ACTIVATE")
        self.alAutonomousBlinking.setEnabled(enabled)

    # Enables or disables the background movements.
    def activate_life_signals(self, params):
        enabled = params.get("ACTIVATELIFESIGNALS")
        self.alBackgroundMovement.setEnabled(enabled)

    # Enables or disables basic awareness.
    def activate_life_signals_awareness(self, params):
        enabled = params.get("ACTIVATELIFESIGNALSINT")
        self.alBasicAwareness.setEnabled(enabled)

    # Sets the engagement mode.
    # https://developer.softbankrobotics.com/pepper-naoqi-25/naoqi-developer-guide/naoqi-apis/naoqi-interaction-engines/albasicawareness#albasicawareness-engagement-modes
    def set_engagement_type(self, params):
        modeName = params.get("DEFENGAGEMENTTYPE")
        self.alBasicAwareness.setEngagementMode(modeName)

    # Enables or disables the listening movements.
    def activate_hearing_movement(self, params):
        enabled = params.get("ACTIVATEACTIVEHEARING")
        self.alListeningMovement.setEnabled(enabled)

    # Enables or disables the speaking movements.
    def activate_speak_movements(self, params):
        enabled = params.get("ACTIVATESPEAKMOVEMENTS")
        self.alSpeakingMovementProxy.setEnabled(enabled)

    # Sets the current speaking movement mode.  Random - Contextual
    def define_conversation_mode(self, mode):
        self.alSpeakingMovementProxy.setMode(mode)

    # Enable/disable the push-recovery reflex of the robot, but only if allowed by the owner. If not allowed, an exception is thrown.
    def activate_push_reflexes(self, params):
        enabled = params.get("ACTIVATEPUSHREFLEXES")
        self.alMotionProxy.setPushRecoveryEnabled(enabled)

    # Starts or stops breathing animation on a chain.
    def activate_breath_movement(self, params):
        extremity_to_enabled = "Body"
        enabled = params.get("ACTIVATEBREATHMOV")
        self.alMotionProxy.setBreathEnabled(extremity_to_enabled, enabled)

    # Enables or disables the movement detection to detect people. This can make the overall process slower if enabled
    def activate_movement_detection(self, params):
        enabled = params.get("ACTIVATEMOVDETECTION")
        self.alPeoplePerception.setMovementDetectionEnabled(enabled)

    # Enables/disables the face recognition process. The remaining face detection process will be faster if face recognition is disabled. Face recognition is enabled by default.
    def activate_face_detection(self, params):
        enabled = params.get("ACTIVATELIFESIGNALSINT")
        self.alFaceDetection.setRecognitionEnabled(enabled)

    # Enable/Disable Anti-collision protection of the arms of the robot.
    def activate_colission_detection(self, params):
        chainName = "Arms"
        enabled = params.get("ACTIVATECOLISSIONDETECT")
        self.alMotionProxy.setCollisionProtectionEnabled(chainName, enabled)

    # Enables or disables power monitoring.
    def activate_monitoring_charge_service(self, params):
        enabled = params.get("ACTIVATEMONITORINGCHARGESERV")
        self.alBatteryProxy.enablePowerMonitoring(enabled)

    # Get battery charge.
    def get_battery(self):
        return self.alBatteryProxy.getBatteryCharge()

    # Return the actual state of the temperature diagnosis. Only the highest level of failure is returned.
    def get_temperature(self):
        return self.alBodyTemperatureProxy.getTemperatureDiagnosis()

    # Gets the emotional state of the current focused user through a PersonState struct.
    def get_emotion_state(self):
        return self.alMood.currentPersonState()

    #                        NI PINSHI IDEA DE COMO DEJAR EL LOGIN

    # Se verifica el login, es decir, se revisa que alguno de los usuarios con sesion activa coincida con
    # el que esta interactuando con el robot
    def login(self):
        for i in self.alUserSession.getOpenUserSessions():
            if i == self.alUserSession.getFocusedUser():
                return True

        return False

    # Looks for a free circular zone of a specified radius not farer than a specified displacement.
    def search_free_zone(self, params):
        radius = params.get("RADIO")
        displacement = params.get("DISTANCIAMAX")
        return self.alNavigationProxy.findFreeZone(radius, displacement)

    # Looks for a free circular zone of a specified radius not farer than a specified displacement
    def get_free_zone(self, radius, displacement):
        return self.alNavigationProxy.getFreeZone(radius, displacement)

    # Gets the coordinates x, y, theta of the pose2D of the robot
    def get_robot_position(self, params):
        enabled = params.get("GETROBOTPOSITION")
        return self.alLocalizationProxy.getRobotPosition(enabled)

    # Makes the robot move at the given velocity, expressed in FRAME_ROBOT
    # Z is rotation
    def move(self, x, y, z):
        self.alMotion.move(x, y, z)

    # Makes the robot move to the given pose in the ground plane, relative to FRAME_ROBOT
    def move_forward(self, x, y, speed):
        self.alMotion.moveTo(x, y, speed)

    # Makes the robot navigate to a relative metrical target pose2D expressed in FRAME_ROBOT.
    def move_to(self, params):
        x = params.get("MOVETOX")
        y = params.get("MOVETOY")
        self.alNavigationProxy.navigateTo(x, y)

    # Go to the given position trying to perform a visual close loop with the image contained in current panorama at theta.
    def move_to_position(self, position):
        self.alLocalizationProxy.goToPosition(position)

    # The robot wakes up
    def wake_up(self):
        self.alMotionProxy.wakeUp()

    # The robot rests: goes to a relaxed and safe position and sets Motor off.
    def suspend(self):
        self.alMotionProxy.rest()

    # Updates the period if relevant.
    def set_refresh_time_sensors(self, sensor, time):
        self.alSensorsProxy.updatePeriod(sensor, time)

    # Launch a green/yellow/red rasta animation on all body.
    def activate_rasta(self, duration):
        self.alLedsProxy.rasta(duration)

    # Launch a random animation in eyes
    def random_eyes(self, duration):
        self.alLedsProxy.randomEyes(duration)

    # Sets the intensity of a LED or Group of LEDs.
    def set_leds_intensity(self, sensor, intensity):
        self.alLedsProxy.setIntensity(sensor, intensity / 100)

    # Sets the color of an RGB led using  color code.
    def change_led_color(self, sensor, red_color, green_color, blue_color, duration):
        self.alLedsProxy.fadeRGB(sensor, red_color, green_color, blue_color, duration)

    # Enable or Disable the smart stiffness reflex for all the joints (True by default).
    # The update takes one motion cycle.
    def activate_stiffness(self, params):
        return self.alMotion.setSmartStiffnessEnabled(params)

    def change_emotion_expression(self, params):
        self.emotionStateRobot.setToneSpeech(params.get("tonoHabla"))
        self.emotionStateRobot.setLedR(params.get("R"))
        self.emotionStateRobot.setLedG(params.get("G"))
        self.emotionStateRobot.setLedB(params.get("B"))
        self.emotionStateRobot.setLedIntensity(params.get("ledIntens"))
        self.emotionStateRobot.setFactorVelocity(params.get("velocidad"))
        self.emotionStateRobot.setVelocitySpeech(params.get("velHabla"))
        self.change_led_color("AllLeds", self.emotionStateRobot.getLedR(), self.emotionStateRobot.getLedG(),
                              self.emotionStateRobot.getLedB(),
                              15.0)
        self.set_leds_intensity("AllLeds", self.emotionStateRobot.getLedIntensity())

    # Turn on/off the tablet screen.
    def tablet_on(self):
        self.alTabletService.turnScreenOn(True)

    # Wake the tablet (from standby mode).
    def wake_tablet(self):
        self.alTabletService.wakeUp()

    # Put the tablet in sleep mode (standby mode).
    def suspend_tablet(self):
        self.alTabletService.goToSleep()

    # Turn on/off the tablet screen.
    def tablet_off(self):
        self.alTabletService.turnScreenOn(False)

    # Open a video player on tablet and play video from given url.
    def show_video(self, params):
        self.alTabletService.playVideo(params.get("SHOWVIDEO"))

    # Close the video player.
    def quit_video(self):
        if activities_running.has_key("SHOWVIDEO"):
            activities_running.pop("SHOWVIDEO")
        self.alTabletService.stopVideo()

    # Pause the video playing but do not close the video player.
    def pause_video(self):
        self.alTabletService.pauseVideo()

    # Resume the video paused by ALTabletService::pauseVideo .
    def resume_video(self):
        self.alTabletService.resumeVideo()

    # Load the image to show to de user
    def preload_image(self, url):
        self.alTabletService.preLoadImage(url)

    # Shows the image in the tablet for the user
    def show_image(self, params):
        self.alTabletService.showImage(params.get(""))

    # Hide image currently displayed.
    def hide_image(self):
        if activities_running.has_key("SHOWIMG"):
            activities_running.pop("SHOWIMG")
        self.alTabletService.hideImage()

    # Set tablet brightness.
    def set_tablet_bright(self, params):
        brightness = params.get("SETTABLETBRIGHT")
        self.alTabletService.setBrightness(brightness)

    # Configure the media volume of the tablet.
    def set_tablet_volume(self, volume):
        self.alTabletService.setVolume(volume)

    # Says the specified string of characters.
    def say(self, params, speed=None, pitch=None):
        if speed is None:
            speed = self.emotionStateRobot.getVelocitySpeech()
        if pitch is None:
            pitch = self.emotionStateRobot.getToneSpeech()
        self.alTexToSpeech.setParameter("speed", speed)
        self.alTexToSpeech.setParameter("pitchShift", pitch)
        self.alTexToSpeech.say(params.get("SAY"))

    #   This method stops the current and all the pending tasks immediately.
    def stop_all(self, params):
        self.alTexToSpeech.stopAll(params.get("STOPALL"))

    # Sets the current gain applied to the signal synthesized by the text to speech engine.
    def set_say_volume(self, params):
        volume = params.get("SETSAYVOLUMEN") / 100
        self.alTexToSpeech.setVolume(volume)

    # Say the annotated text given in parameter and animate it with animations inserted in the text.
    def say_with_movement(self, text):
        self.alAnimatedSpeech.say(text)

    # Sets the overall output volume of the system.
    def set_system_volume(self, volume):
        self.alAudioDevice.setOutputVolume(volume)

    # Starts the playback of the specified file.
    def play_sound(self, sound):
        self.alAudioPlayer.playFile(sound)

    # Pause the playback of the specified task.
    def pause_sound(self, idSound):
        if activities_running.has_key("PLAYSOUND"):
            activities_running.pop("PLAYSOUND")
        self.alAudioPlayer.pause(idSound)

    # Subscribes to ALVoiceEmotionAnalysis .
    def activate_voice_emotion_analysis(self, params):
        subscriberName = params.get("ACTIVATEVOICEEMOANAL")
        self.alVoiceEmotionAnalysis.subscribe(subscriberName)

    # Unsubscribes to ALVoiceEmotionAnalysis .
    def desactivate_voice_emotion_analysis(self):
        self.alVoiceEmotionAnalysis.unsubscribe(self.sensorsModule)

    # Subscribes to ALSpeechRecognition
    def activate_voice_recognition(self, params):
        subscriber = params.get("ACTVOICERECOG")
        self.alSpeechRecognition.subscribe(subscriber)

    # Unsubscribes to ALSpeechRecognition
    def desactivate_voice_recognition(self):
        self.alSpeechRecognition.unsubscribe(self.sensorsModule)

    # Adds the specified topic to the list of the topics that are currently used by the dialog engine to parse the human's inputs.
    def load_conversational_topic(self, params):
        topicName = params.get("name")
        tContent = self.topicContentMap.get(topicName)
        topic = self.alDialogProxy.loadTopicContent(tContent)
        self.topicMap[topicName] = topic
        self.alDialogProxy.activateTopic(topic)
        self.alDialogProxy.suscribe(topic)


    # Unloads the specified topic and frees the associated memory.
    def unload_conversational_topic(self, params):
        if not self.topicMap:
            lista = self.alDialogProxy.getAllLoadedTopics()
            if lista:
                self.alDialogProxy.stopTopics(lista)
        else:
            topicName = params.get("name")
            topic = self.topicMap.get(topicName)
            self.alDialogProxy.unsubscribe(topic)
            tContent = self.topicContentMap.get(topicName)
            self.alDialogProxy.deactivateTopic(topic)
            self.alDialogProxy.unloadTopic(tContent)

    # Says a tagged sentence from a topic.
    def say_under_topic_context(self, topic, tag):
        self.alDialogProxy.say(topic, tag)

    # If multiple topics can be active at the same time, only one of them is used to generate proposals.
    def set_topic_focus(self, topicName):
        self.alDialogProxy.setFocus(topicName)

    def hablar(self, text_to_speech, speed=None, pitch=None):
        if speed is None:
            speed = self.emotionStateRobot.getVelocitySpeech()
        if pitch is None:
            pitch = self.emotionStateRobot.getToneSpeech()

        self.alTexToSpeech.setParameter("speed", speed)
        self.alTexToSpeech.setParameter("pitchShift", pitch)
        self.alTexToSpeech.say(text_to_speech)

    def activate_conversational_topic(self):
        pass

    def desactivate_conversational_topic(self):
        pass

    def registrar_cuidador(params):
        pass

    def historial(params):
        pass

    def seleccionar_actividades(params):
        pass

    def cambiar_actividad(params):
        pass

    def conversacion_empatica(self, params):
        estado_emocional = params.get("estado_emocional")
        switch_emocion = {
            "triste": "conversacion_triste",
            "alegre": "conversacion_alegre",
            "ira": "conversacion_ira"
        }
        func = switch_emocion.get(params)
        func()

    def conversacion_triste(self):
        frase_inicial = "Se que estas triste,"  # realizar una pausa! IMPORTANTE!!!!!!!!!!!!!!
        switch_conversacion = {
            1: "pero sabes? la tristeza nos puede ayudar a hacer una introspeccion y esto nos permite estar mejor.",
            2: "Aveces la tristeza nos puede hacer sentir mal, te cuento que como el resto de emociones tiene una funcion que nos permite volver mejores",
            3: "Sabias que usualmente necesitamos la ayuda de otras personas cuando estamos tristes?",
            4: "y te sientes mal, pero esta emocion te permite sanar heridas"
        }
        frase_principal = "Te gustaria escuchar una cancion?"

    def conversacion_alegre(self):
        frase_inicial = "Me gusta verte asi,"
        switch_conversacion = {
            1: "La alegria te genera una sonrisa hermosa",
            2: "Las personas se desempenian mucho mejor cuando estan alegres",
            3: "La alegria es parte de la vida y es vital para disfrutar nuestra estadia",
            4: "luces genial, esa alegria que reflejas te hace ver mejor"
        }
        frase_principal = "Escuchamos una cancion?"

    def conversacion_ira(self, genero):
        frase_inicial = "Veo que estas enfadad"

        if genero == 'M':
            frase_inicial = frase_inicial + "o"
        else:
            frase_inicial = frase_inicial + "a"

        frase_inicial = frase_inicial + ","

        switch_conversacion = {
            1: "es normal sentir ira, pero no debes dejarla salir de control porque no te permite tomar buenas decisiones",
            2: "aveces la ira te puede hacer sentir mal, sin embargo debes tomar las cosas con serenidad",
            3: "pero sabes? las cosas tienen la importancia que tu les das",
            4: "la ira te indispone y dificulta que pienses con claridad"
        }
        frase_principal = "si quieres podemos escuchar una cancion para relajarnos?"
