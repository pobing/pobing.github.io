---
title: 简单快速的可用性测试
layout: post
guid: urn:uuid:bf62e00b-6b0b-42b5-94b1-f3102e0eefe4
date: 2011-12-19 17:36:38
tags:
  - 软件测试
  - testing
---



可用性测试是改善产品的最佳方式之一，这一点，在内部已经是不争的共识。只是由于用研人手总是不足，所以为了能让各个部门的同事能更快速地展开一些研究和测试的工作，我们陆续整理了一些简单的文档和教程，并计划通过集中的培训来普及一些用户体验的方法。因此，要特别强调的是，本文所介绍的测试方法是简单，非正式的，小样本的，以发现严重问题为目的的。如果要深入了解测试的原理，方法，请参阅以下几本书： 
>《Handbook of usability testing 》

>《Usability testing and research 》

>《Measuring the user experience 》

在开始之前，我要强调，测试要尽早开始，并且只需要简单的设备就可以进行。 

什么是可用性测试？ 

其实可用性测试并不复杂，简单概括就是观察用户使用产品。如果稍微扩展一些，我们可以将其解释为：通过观察有代表性的用户，完成产品的典型任务，而界定出可用性问题并解决这些问题。而目的呢，则是为了让产品用起来更容易。 

如何设计和进行可用性测试? 

根据上面的定义，我们在如何设计和进行可用性测试的部分将主要回答以下几个问题： 

* 如何设计任务 
* 如何找用户 
* 如何进行测试 
* 如何分析找到可用性问题 

如何设计测试任务? 

设计测试任务是可用性测试前期计划的核心，我们建议最好在任务设计之后再确定用户招募的标准，因为测试中涉及什么样的任务和你要描述的用户操作经验直接相关。确定了前者，后者也就更明确了。 

在设计任务前，需要反复的问自己： 

“我设计的测试任务是真的反应了用户的实际目标么（而并不是我认为用户想要做的事）？” 

在问了三次以上上面的问题，并且确定可以肯定的回答自己之后，就可以开始设计任务了。 

通常的方法是： 

1. 先列出一个任务清单，用简单的短句来描述测试中涉及的任务——主要是给内部人员看的。由于是快速测试，因此，任务不宜过多，必须是重要的，核心的，你觉得可能会有问题的任务； 
2. 在筛选完任务清单后，将任务变成场景——场景就是你要读给用户听，或者要给用户看的内容。因此必须要包含用户的目标和动机——因为对用户来说，你的功能并不重要，重要的是他们的目的以及他们完成目的的过程。这时候，你可以再问一次自己上面的问题。 
3. 确定操作任务需要的条件：比如是不是需要一个新的账号，是不是需要准备好必要的文件等等； 
4. 预测试：预测试主要是为了发现任务设计的问题，可以找公司内的同事，利用午休时间快速完成 

**如何找用户?** 

在利用各种资源找用户之前，我们要首先明确，我们要找什么样的用户来？ 

**找什么样的人来？** 

以前，在测试计划阶段，我们和产品以及设计的同事沟通，他们对用户的描述，往往是：25~30岁，上班族之类。但事实上，我们在测试中最关注的是用户的操作行为，因此，在确定用户甄别的标准时，们最应该关注的是产品使用经验和使用行为，而不是人口统计学特征。关于这一内容更详细的解释，可以参看这篇文章。http://www.uie.com/events/uiconf/2008/articles/recruiting_participants/ 

**找几个人来?** 

一谈到要找几个人来测试，就不得不请出Nielsen的这张经典图表。虽然学术界对于5个用户究竟是否足够有很多争论。不过，从我们的实践角度来看，只要在第一个阶段界定的好，找到合适的人，那么，5个用户真的已经可以发现明显的可用性问题了，当然，这里要再一次强调，快速测试的目的是为了发现严重的问题而不是全部的问题。 

此外，我们发现，在平时的测试中，在观察前三个用户测试时，单面镜后的产品和设计人员往往精力集中，下笔如飞，但到了5个之后，新的信息越来越少，大家不是发呆，就是干脆睡了（像图中的兔子一样）。所以，从工作状态的角度讲，5个以内的测试用户，能够保证大家精力集中，并且愿意去观察和倾听。 

**如何找用户？** 

在确定了甄别的标准和用户的数目之后，找用户就成了头痛的问题。在这里，我的建议就是，由于是快速测试，就尝试用尽一切办法，无论是找同事（同部门的同事就不要找了），朋友，朋友的朋友，网站论坛发广告等等，只要快，并且在招募时，坚持要求，大家是可以“不择手段”的。当然了，如果这时候能有一份平时就在维护的用户列表就再好不过了。 

**如何进行测试?** 

因为是快速的测试，主持人从用研人员变成了产品和设计人员自己。因此，在这里要强调的是，在测试中不要试图教用户如何使用产品，也不要试图向用户推销你的产品。 

**主持人做什么?** 

**记录人员做什么?**

无论是有条件实时观察（有专门的体验室或者工具），或者需要回看录像来观察，记录时都要注意，记录的重点不是用户说了什么，而是用户如何使用。记住，在测试中，做了什么比说了什么更重要。当然，由于是为了发现严重问题而进行的测试，并且严重的问题总是显而易见，因此，可以同时记录问题，但不要急于讨论问题的解决方案。因为马上想到的方案或者用户提出的方案并不一定是最好的，这个工作可以留待可以安静思考或者大家讨论时进行

**如何分析找到可用性问题?** 

在完成测试后，需要主持人和观察人员趁着记忆犹新的时候快速地将有用的信息整理出来，可以采用便利贴，也可以专门空出一块白板或者建立一个文档。总之把用户相关的操作，提出的问题，和我们自己发现的问题迅速地写出来。但，不要快速下结论。 

在所有测试完成后，整理已经有的便利贴，列表等，然后找出那些最严重的问题，快速地修复它们。在这一环节，重点是一再地明确，究竟那些问题才是最重要的，并且可以马上修复的。这样，测试的结果才是可执行的，而不是仅仅变成了一张存档的问题列表而已。

转自：网易用户设计体验中心 [http://uedc.163.com/4151.html](http://uedc.163.com/4151.html) 