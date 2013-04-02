/* Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.dunning;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.impl.identity.Authentication;
import org.activiti.engine.test.ActivitiRule;
import org.activiti.engine.*;
import org.junit.*;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;
import org.activiti.engine.task.Task;
import org.activiti.engine.test.Deployment;


/**
 * @author Joram Barrez
 */
public class BasicAdslDunningProcessProcessTest2 {
	
	
  @Rule public ActivitiRule activitiRule = new ActivitiRule();
  
  @Before
  public void setUp() throws Exception {
    
    // Normally the UI will do this automatically for us
    Authentication.setAuthenticatedUserId("kermit");
  }
  
  @After
  public void tearDown() throws Exception {
    Authentication.setAuthenticatedUserId(null);
  }
  
  @Deployment(resources = {"com/dunning/BasicAdslDunningProcess.bpmn"})
  @Test
  public void testReviewSalesLeadProcess() {
    
    // After starting the process, a task should be assigned to the 'initiator' (normally set by GUI)
    Map<String, Object> variables = new HashMap<String, Object>();
    variables.put("initiator", "fozzie");
    variables.put("invoice_id", "123123123");
    RuntimeService runtimeService = activitiRule.getRuntimeService();
    String procId = runtimeService.startProcessInstanceByKey("BasicAdslDunningProcess",variables).getId();
  }

}
